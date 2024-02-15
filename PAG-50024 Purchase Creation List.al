page 50024 "Purchase Creation List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = 50016;
    UsageCategory = Lists;
    CardPageID = 50023;
    Permissions = tabledata 480 = rimd;
    Caption = 'Purchase creation List';
    // SourceTableView = where("Created On Purchase" = const(false));


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = all;
                    Caption = 'Vendor Invoice No.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Created On Purchase invoice"; Rec."Created On Purchase")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Global Dimension Code 1"; Rec."Global Dimension Code 1")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension Code 2"; Rec."Global Dimension Code 2")
                {
                    ApplicationArea = all;
                }
                field("Dimension 4 Code"; Rec."Dimension 4 Code")
                {
                    ApplicationArea = all;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportData)
            {
                ApplicationArea = All;
                Caption = 'Import data from excel';

                trigger OnAction();
                var
                    CreationXml: XmlPort 50011;
                begin
                    CreationXml.Run();
                end;
            }
            action(ExportData)
            {
                ApplicationArea = All;
                Caption = 'Export format to excel';

                trigger OnAction();
                var
                    VarOutstream: InStream;
                    CreationXml: Report 50022; //(it's a report)
                    RecCreationHeader: Record "Purchase Creation Header";
                    Txt: Text;
                begin
                    // Report.Run(50101, false, false);
                    RecCreationHeader.Reset();
                    RecCreationHeader.SetRange("No.", Rec."No.");
                    if RecCreationHeader.FindFirst() then
                        report.Run(50022, false, false, RecCreationHeader)
                end;
            }
            // action(exports)
            // {
            //     ApplicationArea = all;
            //     Caption = 'Export CSV Format to Excel';
            //     trigger OnAction();
            //     var
            //         TestXMl: XmlPort 50000;
            //         RecCreationHeader: Record "Sale Creation Header";
            //     begin
            //         TestXMl.Run();

            //         RecCreationHeader.Reset();
            //         RecCreationHeader.SetRange("No.", Rec."No.");
            //         if RecCreationHeader.FindFirst() then
            //             Xmlport.Run(50000, false, false, RecCreationHeader)
            //         else
            //             Report.Run(50010);

            //     end;
            // }
            action("Create Purchase invoice/order")
            {
                ApplicationArea = all;
                Caption = 'Create Purchase invoice/order';
                // AccessByPermission:

                trigger OnAction();
                var
                    RecPurchHeader: Record "Purchase Header";
                    RecPurchLine: Record "Purchase Line";
                    NoSeriesManagement: Codeunit 396;
                    RecPurchPay: Record "Purchases & Payables Setup";
                    NextNo: Code[20];
                    CalculateTax: Codeunit "Calculate Tax";
                    RecPurchCreationLine: Record 50017;
                    XLineNo: Integer;
                    RecDefdim: Record "Default Dimension";
                    RecDim: Record "Dimension Set Entry";
                    RecPurchaeCreationHeader: Record "Purchase Creation Header";

                    DimValue: Record "Dimension Value";
                    DimSetEntry: Record "Dimension Set Entry" TEMPORARY;
                    DimnMgmt: Codeunit DimensionManagement;
                begin
                    RecPurchHeader.Reset();
                    RecPurchHeader.SetRange("Buy-from Vendor No.", Rec."Vendor No.");
                    RecPurchHeader.SetRange("Vendor Invoice No.", Rec."External Document No.");
                    RecPurchHeader.SetRange("Document Type", Rec."Document Type");
                    if RecPurchHeader.FindFirst() then begin
                        if Rec."Document Type" = Rec."Document Type"::Invoice then
                            Error('This Line is already on the Purchase Invoice');
                        if Rec."Document Type" = Rec."Document Type"::Order then
                            Error('This Line is already on the Purchase Order');
                    end else begin
                        RecPurchHeader.Init();
                        RecPurchHeader."Document Type" := Rec."Document Type";
                        RecPurchHeader.Insert(true);
                        RecPurchHeader.Validate("Buy-from Vendor No.", Rec."Vendor No.");
                        RecPurchHeader.Validate("Vendor Invoice No.", Rec."External Document No.");
                        RecPurchHeader.Validate("Posting Date", Rec."Posting Date");
                        RecPurchHeader.Validate("Shortcut Dimension 1 Code", Rec."Global Dimension Code 1");
                        RecPurchHeader.Validate("Shortcut Dimension 2 Code", Rec."Global Dimension Code 2");
                        RecPurchHeader.ValidateShortcutDimCode(4, Rec."Dimension 4 Code");
                        RecPurchHeader.ValidateShortcutDimCode(6, Rec."Customer Code");  //Added 26/10/23 Gaurav

                        /*
                                                DimSetEntry.DeleteAll();
                                                DimValue.reset;
                                                DimValue.SetRange("Dimension Code", 'CUSTOMER');
                                                DimValue.SetRange(code, Rec."Customer Code");
                                                if DimValue.FindFirst() then begin
                                                    DimSetEntry.Validate("Dimension Code", 'CUSTOMER');
                                                    DimSetEntry.Validate("Dimension Value Code", Rec."Customer Code");
                                                    DimSetEntry.insert(true);
                                                    DimSetEntry.reset;
                                                    DimSetEntry.SetCurrentKey("Dimension Value ID");
                                                    RecPurchHeader.validate("Dimension Set ID", DimnMgmt.GetDimensionSetID(DimSetEntry));
                                                    DimnMgmt.UpdateGlobalDimFromDimSetID(RecPurchHeader."Dimension Set ID", RecPurchHeader."Shortcut Dimension 1 Code", RecPurchHeader."Shortcut Dimension 2 Code");
                                                end;
                                                DimValue.reset;
                                                DimValue.SetRange("Dimension Code", 'SEGMENT');
                                                DimValue.SetRange(code, Rec."Global Dimension Code 1");
                                                if DimValue.FindFirst() then begin
                                                    DimSetEntry.Validate("Dimension Code", 'SEGMENT');
                                                    DimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension Code 1");
                                                    DimSetEntry.insert(true);
                                                    DimSetEntry.reset;
                                                    DimSetEntry.SetCurrentKey("Dimension Value ID");
                                                    RecPurchHeader.validate("Dimension Set ID", DimnMgmt.GetDimensionSetID(DimSetEntry));
                                                    DimnMgmt.UpdateGlobalDimFromDimSetID(RecPurchHeader."Dimension Set ID", RecPurchHeader."Shortcut Dimension 1 Code", RecPurchHeader."Shortcut Dimension 2 Code");
                                                end;
                                                DimValue.reset;
                                                DimValue.SetRange("Dimension Code", 'REGION');
                                                DimValue.SetRange(code, Rec."Global Dimension Code 2");
                                                if DimValue.FindFirst() then begin
                                                    DimSetEntry.Validate("Dimension Code", 'REGION');
                                                    DimSetEntry.Validate("Dimension Value Code", Rec."Global Dimension Code 2");
                                                    DimSetEntry.insert(true);
                                                    DimSetEntry.reset;
                                                    DimSetEntry.SetCurrentKey("Dimension Value ID");
                                                    RecPurchHeader.validate("Dimension Set ID", DimnMgmt.GetDimensionSetID(DimSetEntry));
                                                    DimnMgmt.UpdateGlobalDimFromDimSetID(RecPurchHeader."Dimension Set ID", RecPurchHeader."Shortcut Dimension 1 Code", RecPurchHeader."Shortcut Dimension 2 Code");
                                                end;
                                                DimValue.reset;
                                                DimValue.SetRange("Dimension Code", 'SERVICE');
                                                DimValue.SetRange(code, Rec."Dimension 4 Code");
                                                if DimValue.FindFirst() then begin
                                                    DimSetEntry.Validate("Dimension Code", 'SERVICE');
                                                    DimSetEntry.Validate("Dimension Value Code", Rec."Dimension 4 Code");
                                                    DimSetEntry.insert(true);
                                                    DimSetEntry.reset;
                                                    DimSetEntry.SetCurrentKey("Dimension Value ID");
                                                    RecPurchHeader.validate("Dimension Set ID", DimnMgmt.GetDimensionSetID(DimSetEntry));
                                                    DimnMgmt.UpdateGlobalDimFromDimSetID(RecPurchHeader."Dimension Set ID", RecPurchHeader."Shortcut Dimension 1 Code", RecPurchHeader."Shortcut Dimension 2 Code");
                                                end;
                        */  //Commented due to issues in the code  04/09/2023
                        RecPurchHeader.Modify();
                        //Line insertion//
                        RecPurchCreationLine.Reset();
                        RecPurchCreationLine.SetRange("Document No.", Rec."No.");
                        if RecPurchCreationLine.FindSet() then begin
                            repeat
                                RecPurchLine.Init();
                                RecPurchLine."Line No." := RecPurchCreationLine."Line No.";
                                RecPurchLine.Validate("Document Type", RecPurchHeader."Document Type");
                                RecPurchLine.Validate("Document No.", RecPurchHeader."No.");

                                RecPurchLine.Validate(Type, RecPurchCreationLine.Type);
                                RecPurchLine.Validate("No.", RecPurchCreationLine."No.");
                                RecPurchLine.Validate(Quantity, RecPurchCreationLine.Qunatity);
                                RecPurchLine.Validate("Direct Unit Cost", RecPurchCreationLine."Direct Unit Cost");
                                RecPurchLine.Validate("Deferral Code", RecPurchCreationLine."Deferral Code");
                                RecPurchLine.Validate("GST Group Code", RecPurchCreationLine."GST Group Code");
                                RecPurchLine.Validate("HSN/SAC Code", RecPurchCreationLine."HSN/SAC Code");
                                RecPurchLine.Insert();
                                RecPurchLine.Validate("TDS Section Code", RecPurchCreationLine."TDS Section");
                                RecPurchLine.Modify();
                                // RecPurchLine.Modify();
                                // Rec.Delete();
                                Rec."Created On Purchase" := true;
                                Rec.Modify();
                                CalculateTax.CallTaxEngineOnPurchaseLine(RecPurchLine, RecPurchLine);
                            until RecPurchCreationLine.Next() = 0;
                        end;
                        if Rec."Created On Purchase" = true then begin
                            RecPurchCreationLine.SetRange("Document No.", Rec."No.");
                            if RecPurchCreationLine.FindSet() then begin
                                RecPurchCreationLine.Delete();
                            end;
                            Rec.Delete();
                        end;//sss
                    end;

                    Message('Data inserted on "Purchase invoice/order"');
                    //     until RecPurchaeCreationHeader.Next() = 0;

                    // end; //Gaurav
                end;

                // end;

            }

        }
        // area(navigation)
        // {
        //     group("&Invoice")
        //     {
        //         Caption = '&Invoice';
        //         Image = Invoice;
        //         action(Statistics)
        //         {
        //             ApplicationArea = Suite;
        //             Caption = 'Statistics';
        //             Image = Statistics;
        //             RunObject = Page SaleCreationStatistics;
        //             RunPageLink = "No." = FIELD("No.");
        //             ShortCutKey = 'F7';
        //             AboutTitle = 'Your profit from a sale';
        //             AboutText = 'Go here to see statistics about the selected invoice, your profit, and associated taxes.';
        //             ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
        //         }
        //     }
        // }
    }
    var
        RecPage: Page 55;
        DimVal: Record "Dimension Value";
        DimSetEntryTmp: Record "Dimension Set Entry" temporary;
}
pageextension 50145 PageExt50145 extends 509
{
    layout
    {
        addafter("Buy-from Post Code")
        {
            field("P.O. Vendor"; Rec."P.O. Vendor")
            {
                ApplicationArea = all;
            }
            field("Requestor ID"; Rec."Requestor ID")
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
        }
        addafter("Buy-from City")
        {
            field("PO No. Series"; Rec."PO No. Series")
            {
                ApplicationArea = all;

                trigger OnLookup(var Text: Text): Boolean
                var
                    RecNoSeries: Record "No. Series";
                    PurPayableSetup: Record "Purchases & Payables Setup";
                begin
                    //**JDIL1.0**PURCUST-004**001**27-08-08**NMS
                    /*
                    PurchSetup.GET;
                    if PurchSetup."Order Nos." <> '' then
                        NoseriesMgt.SelectSeries(PurchSetup."Order Nos.", PurchSetup."Order Nos.", Rec."PO No. Series")
                    else begin
                        */ //16767

                    RecNoSeries.Reset;
                    if RecNoSeries.FindSet then begin
                        if Page.RunModal(456, RecNoSeries) = Action::LookupOK then begin
                            // Rec."Posting No. Series" := RecNoSeries.Code;
                            Rec."PO No. Series" := RecNoSeries.Code;
                            CurrPage.Update((true));
                        end;
                    end;

                    PurPayableSetup.Get();
                    PurPayableSetup."Order Nos." := Rec."PO No. Series";
                    PurPayableSetup.Modify();
                    // //end;
                    //**JDIL1.0**PURCUST-004**001**27-08-08**NMS
                end;
            }
        }
        addafter("Order Date")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
            }
            field("No. Series"; Rec."No. Series")
            {
                ApplicationArea = all;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = all;
            }
        }
        addafter("Assigned User ID")
        {
            field("Foreclosure Type"; Rec."Foreclosure Type")
            {
                ApplicationArea = all;
            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            ShowMandatory = true;
        }
        addafter("Shortcut Dimension 1 Code")
        {
            field(Priority; Rec.Priority)
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
            field("Department Name"; Rec."Department Name")
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
            field("Purchase Location"; Rec."Purchase Location")
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }
            field("Indent By"; Rec."Indent By")
            {
                NotBlank = true;
                ApplicationArea = all;
                ShowMandatory = true;
            }
        }
        modify("Shortcut Dimension 2 Code")
        {
            ShowMandatory = true;
        }
        addafter("Ship-to Address")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                ApplicationArea = all;
            }
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = all;
            }
        }
        addafter("Location Code")
        {
            field("Ref. No."; Rec."Ref. No.")
            {
                ApplicationArea = all;
            }
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addafter(Approvals)
        {
            action(Foreclose)
            {
                ApplicationArea = All;
                Image = Close;

                trigger OnAction()
                begin
                    //SN-TEC-T20610+
                    IF NOT CONFIRM('Do you want to Foreclose', FALSE) THEN
                        EXIT;
                    PurchLine.RESET;
                    PurchLine.SETRANGE("Document Type", PurchLine."Document Type"::"Blanket Order");
                    PurchLine.SETRANGE("Document No.", Rec."No.");
                    IF PurchLine.FINDSET THEN
                        REPEAT
                            PurchLine."MR Foreclose" := TRUE;
                            PurchLine."Qty. to Receive" := 0;
                            PurchLine."MR Foreclose Date" := WORKDATE;
                            PurchLine.MODIFY;
                            ForeClosed := TRUE;
                            CurrPage.UPDATE(FALSE);
                        UNTIL PurchLine.NEXT = 0;
                    //SN-TEC-T20610- 
                end;
            }
            action(UndoForeclose)
            {
                ApplicationArea = All;

                Visible = FALSE;
                Image = Undo;

                trigger OnAction()
                begin
                    //SN-TEC-T20610+
                    IF NOT CONFIRM('Do you want to Foreclose', FALSE) THEN
                        EXIT;
                    PurchLine.RESET;
                    PurchLine.SETRANGE("Document Type", PurchLine."Document Type"::"Blanket Order");
                    PurchLine.SETRANGE("Document No.", Rec."No.");
                    IF PurchLine.FINDSET THEN
                        REPEAT
                            PurchLine."MR Foreclose" := FALSE;
                            PurchLine."Qty. to Receive" := PurchLine.Quantity;
                            PurchLine."MR Foreclose Date" := 0D;
                            PurchLine.MODIFY;
                            ForeClosed := FALSE;
                            CurrPage.UPDATE(FALSE);
                        UNTIL PurchLine.NEXT = 0;
                    //SN-TEC-T20610-
                end;
            }
        }
        addafter(CalculateInvoiceDiscount)
        {
            action(Attachment)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    JobDocumentsnew: Record "Job Documents new";
                begin

                    JobDocumentsnew.RESET;
                    JobDocumentsnew.SETRANGE("Job No.", Rec."No.");
                    JobDocumentsnew.SETRANGE("Document Type", JobDocumentsnew."Document Type"::"Blanket Order ");
                    PAGE.RUNMODAL(Page::"Job Documents new", JobDocumentsnew);
                end;
            }
        }
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                MandatoryFields();   //DS added for Mandatory fields.
                IF NOT CONFIRM('Do you want to Send Approval', TRUE) THEN
                    EXIT;
            end;
        }
        modify(CancelApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                IF NOT CONFIRM('Do you want to Cancel Approval', FALSE) THEN
                    EXIT;

            end;
        }
        addafter(CancelApprovalRequest)
        {
            action("Generate RFQ")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = MakeOrder;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";

                begin
                    //SN-MR+
                    MandatoryFields();
                    MRtoRFQ.GetRFQHeader(RFQHeader);
                    MRtoRFQ.RUN(Rec);
                    //SN-MR-
                end;
            }
        }
        modify(MakeOrder)
        {
            trigger OnBeforeAction()
            begin
                MandatoryFields();
            end;

            //->17141-Team-3/11/23 commented
            // trigger OnAfterAction()
            // var
            //     PLine: Record "Purchase Line";
            // begin
            //     PLine.Reset();
            //     PLine.SetRange("Blanket Order No.", Rec."No.");
            //     if PLine.FindFirst() then begin
            //         PLine."Buy-from Vendor No." := rec."P.O. Vendor";
            //         PLine.Modify();

            //     end;
            // end;
            //<-17141-Team-3/11/23
        }
        addafter(Print)
        {
            action("MR Report")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PH.RESET;
                    PH.SETRANGE("No.", Rec."No.");
                    IF PH.FINDFIRST THEN
                        REPORT.RUNMODAL(Report::"Material Requisition (MR)", TRUE, TRUE, PH);
                end;
            }
            action("Print Material Requisition")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TESTFIELD(Priority);
                    Rec.TESTFIELD("Department Name");
                    Rec.TESTFIELD("Purchase Location");
                    Rec.TESTFIELD("Indent By");
                    PH.RESET;
                    PH.SETRANGE(PH."No.", Rec."No.");
                    IF PH.FINDFIRST THEN
                        REPORT.RUN(Report::"Material Requisition(MR)", TRUE, FALSE, PH);

                end;
            }
        }
    }

    var
        PurchLine: Record "Purchase Line";
        ForeClosed: Boolean;
        MRtoRFQ: Codeunit "Generate BPO-RFQ_CS_PO";
        RFQHeader: Record "RFQ Header";
        PH: Record "Purchase Header";
        NoseriesMgt: Codeunit NoSeriesManagement;
        PurchSetup: Record "Purchases & Payables Setup";

    LOCAL PROCEDURE MandatoryFields();
    BEGIN
        IF Rec."Indent By" = '' THEN
            ERROR('Indent Should not be Empty');
        IF Rec."Purchase Location" = 0 THEN
            ERROR('Purchase Location Should not be Empty');
        IF Rec."Department Name" = 0 THEN
            ERROR('Department Name Should not be Empty');
        IF Rec.Priority = 0 THEN
            ERROR('Priority Should not be Empty');
        IF Rec."Shortcut Dimension 1 Code" = '' THEN
            ERROR('Accounting Location Should not be Empty');
        IF Rec."Shortcut Dimension 2 Code" = '' THEN
            ERROR('Division Code Should not be Empty');
        IF Rec."Location Code" = '' THEN
            ERROR('Location Code Should not be Empty');
        IF Rec."Reason Code" = '' THEN
            ERROR('Reason Code Should not be Empty');
        IF Rec."Requestor ID" = '' THEN
            ERROR('Requestor ID Should not be Empty');
        //IF "Dimension Set ID" = 0 THEN
        //  ERROR('Dimension Set Id Should not be Empty');
    END;
}
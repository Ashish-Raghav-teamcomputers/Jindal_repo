/// <summary>
/// Report Daily Dispatch Report 2 (ID 50080).
/// </summary>
Report 50080 "Daily Dispatch Report 2"
{
    UsageCategory = Lists;
    RDLCLayout = './Report/50080-DailyDispatchReport2.Report.rdlc';
    DefaultLayout = RDLC;
    ApplicationArea = all;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = where("Sales Type" = filter("Job Work"));
            column(OnlyInvoice; OnlyInvoice)
            {
            }
            column(VehicleNo_SalesShipmentHeader; "Sales Shipment Header"."Vehicle No.")
            {
            }
            column(LRRRNo_SalesShipmentHeader; "Sales Shipment Header"."LR/RR No.")
            {
            }
            column(LRRRDate_SalesShipmentHeader; "Sales Shipment Header"."LR/RR Date")
            {
            }
            column(TransporterName_SalesShipmentHeader; "Sales Shipment Header"."Transporter Name")
            {
            }
            column(PlaceOfSupply; PlaceOfSupply)
            {
            }
            column(InwardBSNo_SalesShipmentHeader; "Sales Shipment Header"."Inward BS No.")
            {
            }
            column(InwardBSDate_SalesShipmentHeader; "Sales Shipment Header"."Inward BS Date")
            {
            }
            column(InwardDCNo_SalesShipmentHeader; "Sales Shipment Header"."Inward DC No.")
            {
            }
            column(InwardDCDate_SalesShipmentHeader; "Sales Shipment Header"."Inward DC Date")
            {
            }
            column(ShiptoName_SalesShipmentHeader; "Sales Shipment Header"."Ship-to Name")
            {
            }
            column(CustomerGroup; CustomerGroup)
            {
            }
            column(PostingDate_ItemLedgerEntry; Format("Sales Shipment Header"."Posting Date"))
            {
            }
            column(CustomerName; "Sales Shipment Header"."Bill-to Name")
            {
            }
            column(GetFilters; GetFilters)
            {
            }
            column(ExternalDocumentNo_SalesShipmentHeader; "Sales Shipment Header"."External Document No.")
            {
            }
            column(BilltoCity_SalesShipmentHeader; "Sales Shipment Header"."Bill-to City")
            {
            }
            column(DocumentNo_ItemLedgerEntry; "Sales Shipment Header"."No.")
            {
            }
            column(OrderDate_SalesShipmentHeader; "Sales Shipment Header"."Order Date")
            {
            }
            column(Zone1; Zone1)
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = filter(Item), Quantity = filter(<> 0));
                column(Bags_SalesShipmentLine; BagsNo * -1)
                {
                }
                column(Description_SalesShipmentLine; "Sales Shipment Line".Description)
                {
                }
                column(InvNo; InvNo)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                dataitem("Item Ledger Entry"; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = field("Document No."), "Document Line No." = field("Line No.");
                    column(GSTAmount; GSTAmount * -1)
                    {
                    }
                    column(LotNo_ItemLedgerEntry; "Item Ledger Entry"."Lot No.")
                    {
                    }
                    column(Value; ("Sales Shipment Line"."Unit Price" * Quantity) * -1)
                    {
                    }
                    column(SNo; SNo)
                    {
                    }
                    column(UnitofMeasureCode_ItemLedgerEntry; "Item Ledger Entry"."Unit of Measure Code")
                    {
                    }
                    column(JWCharge; JWCharge)
                    {
                    }
                    column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity * -1)
                    {
                    }
                    column(Bags_SalesShipmentLine2; BagsNo * -1)
                    {
                    }
                    column(TotalAmount2; TotalAmount)
                    {
                    }
                    trigger OnAfterGetRecord();
                    var
                        GSTGroupRec: Record "GST Group";
                    begin
                        GSTRate := 0;
                        GSTAmount := 0;
                        JWCharge := 0;
                        SalesShipmentLine.Reset;
                        SalesShipmentLine.SetRange("Document No.", "Item Ledger Entry"."Document No.");
                        SalesShipmentLine.SetRange("Item For Jobwork Charges", true);
                        if SalesShipmentLine.FindFirst then begin
                            JWCharge := (SalesShipmentLine."Unit Price" * "Item Ledger Entry".Quantity) * -1;
                            // GSTAmount := ((Quantity * SalesShipmentLine."Unit Price") * SalesShipmentLine."GST %") / 100;
                            GSTGroupRec.Reset();
                            GSTGroupRec.SetRange(Code, SalesShipmentLine."GST Group Code");
                            if GSTGroupRec.FindFirst() then
                                GSTRate := GSTGroupRec."GST Rate";
                            GSTAmount := ((Quantity * SalesShipmentLine."Unit Price") * GSTRate) / 100;
                        end;
                        TotalAmount := 0;
                        if JWCharge <> 0 then
                            // TotalAmount := Quantity * "Sales Shipment Line"."Unit Price" + "Sales Shipment Line"."GST Base Amount";
                        TotalAmount := Quantity * "Sales Shipment Line"."Unit Price" + GSTAmount;
                        BagsNo := 0;
                        BagsNo := (BISDevelopment.TextChangeToNumeric("Sales Shipment Line"."Packing Specification") / "Sales Shipment Line".Quantity) * "Item Ledger Entry".Quantity;

                    end;

                }
                trigger OnAfterGetRecord();
                begin
                    InvNo := '';
                    if not "Sales Shipment Line"."Item For Jobwork Charges" then begin
                        SalesShipmentLine.Reset;
                        SalesShipmentLine.SetRange("Document No.", "Sales Shipment Line"."Document No.");
                        SalesShipmentLine.SetRange("Item For Jobwork Charges", true);
                        SalesShipmentLine.SetFilter(Quantity, '<>0');
                        if SalesShipmentLine.FindFirst then begin
                            ILE.Reset;
                            ILE.SetRange("Document No.", SalesShipmentLine."Document No.");
                            ILE.SetRange("Document Line No.", SalesShipmentLine."Line No.");
                            if ILE.FindFirst then begin
                                ValueEntry.Reset;
                                ValueEntry.SetRange("Item Ledger Entry No.", ILE."Entry No.");
                                ValueEntry.SetRange("Document Type", ValueEntry."document type"::"Sales Invoice");
                                ValueEntry.SetRange(Adjustment, false);
                                if ValueEntry.FindFirst then
                                    InvNo := ValueEntry."Document No.";
                            end;
                        end;
                    end;
                end;

            }
            trigger OnPreDataItem();
            begin
                SetRange("Location Code", LocationCode);
                SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                if CustomerPosgroup <> '' then
                    SetRange("Customer Posting Group", CustomerPosgroup);
            end;

            trigger OnAfterGetRecord();
            begin
                Zone1 := '';
                RecmState.Reset;
                RecmState.SetRange(Code, "Sales Shipment Header"."GST Bill-to State Code");
                if RecmState.FindFirst then begin
                    Zone1 := RecmState."State Code for TIN";
                end;
                CustomerGroup := '';
                if Customer.Get("Sales Shipment Header"."Bill-to Customer No.") then begin
                    CustomerName := Customer.Name;
                    if Customer2.Get(Customer."Customer Group") then begin
                        CustomerGroup := Customer2.Name
                        /* IF Customer2.Name = CustomerGroup THEN
                           SNo:=SNo+1
                         ELSE
                           SNo+=1;
                         CustomerGroup:=Customer2.Name; */
                    end;
                end;
                PlaceOfSupply := '';
                if RecState.Get("Sales Shipment Header"."GST Bill-to State Code") then
                    PlaceOfSupply := RecState.Description
                else
                    if RecState.Get("Sales Shipment Header"."GST Ship-to State Code") then
                        PlaceOfSupply := RecState.Description;

            end;

        }
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = where("Sales Type" = filter(< "Job Work"));
            column(VehicleNo_SalesInvoiceHeader; "Sales Invoice Header"."Vehicle No.")
            {
            }
            column(TransporterName_SalesInvoiceHeader; "Sales Invoice Header"."Transporter Name")
            {
            }
            column(LRRRNo_SalesInvoiceHeader; "Sales Invoice Header"."LR/RR No.")
            {
            }
            column(LRRRDate_SalesInvoiceHeader; "Sales Invoice Header"."LR/RR Date")
            {
            }
            column(PlaceOfSupplyPMV; PlaceOfSupplyPMV)
            {
            }
            column(CustomerGrouppMV; CustomerGrouppMV)
            {
            }
            column(InwardBSNo_SalesInvoiceHeader; "Sales Invoice Header"."Inward BS No.")
            {
            }
            column(InwardBSDate_SalesInvoiceHeader; "Sales Invoice Header"."Inward BS Date")
            {
            }
            column(InwardDCNo_SalesInvoiceHeader; "Sales Invoice Header"."Inward DC No.")
            {
            }
            column(InwardDCDate_SalesInvoiceHeader; "Sales Invoice Header"."Inward DC Date")
            {
            }
            column(BilltoCity_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to City")
            {
            }
            column(ExternalDocumentNo_SalesInvoiceHeader; "Sales Invoice Header"."External Document No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; Format("Sales Invoice Header"."Posting Date"))
            {
            }
            column(BilltoName_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(ShiptoName_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Name")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
            {
            }
            column(Zone; Zone)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Quantity = filter(<> 0), Type = filter(Item));
                column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                {
                }
                dataitem("Value Entry"; "Value Entry")
                {
                    DataItemLink = "Document No." = field("Document No."), "Document Line No." = field("Line No.");
                    DataItemTableView = where("Document Type" = filter("Sales Invoice"), Adjustment = filter(false));
                    dataitem(ItemLedgerEntryPMV; "Item Ledger Entry")
                    {
                        DataItemLink = "Entry No." = field("Item Ledger Entry No.");
                        column(LotNo_ItemLedgerEntryPMV; ItemLedgerEntryPMV."Lot No.")
                        {
                        }
                        column(Quantity_ItemLedgerEntryPMV; ItemLedgerEntryPMV.Quantity * -1)
                        {
                        }
                        column(UnitofMeasureCode_ItemLedgerEntryPMV; ItemLedgerEntryPMV."Unit of Measure Code")
                        {
                        }
                        column(Amount_SalesInvoiceLine; "Sales Invoice Line".Amount * (Quantity / "Sales Invoice Line".Quantity) * -1)
                        {
                        }
                        column(TotalGSTAmount_SalesInvoiceLine; GSTAmountS * (Quantity / "Sales Invoice Line".Quantity) * -1)
                        {
                        }
                        column(AmountToCustomer_SalesInvoiceLine; AmttoCustomer * (Quantity / "Sales Invoice Line".Quantity) * -1)
                        {
                        }
                        column(FrieghtCharge; FrieghtCharge)
                        {
                        }
                        column(BagsNo2; BagsNo2 * -1)
                        {
                        }
                        trigger OnAfterGetRecord();
                        var
                            DetGSTLedgerEntryG: Record "Detailed GST Ledger Entry";
                        begin
                            FrieghtCharge := FrieghtCharge * (ItemLedgerEntryPMV.Quantity / "Sales Invoice Line".Quantity);
                            BagsNo2 := 0;
                            BagsNo2 := (BISDevelopment.TextChangeToNumeric("Sales Invoice Line"."Packing Specification") / "Sales Invoice Line".Quantity) * ItemLedgerEntryPMV.Quantity;

                            AmttoCustomer := 0;
                            CustLedgerEntry.RESET;
                            CustLedgerEntry.SETRANGE(CustLedgerEntry."Document No.", "Sales Invoice Line"."Document No.");
                            IF CustLedgerEntry.FINDFIRST THEN begin
                                CustLedgerEntry.CALCFIELDS("Amount (LCY)");
                                AmttoCustomer += CustLedgerEntry."Amount (LCY)";
                            end;

                            Clear(GSTAmountS);
                            DetGSTLedgerEntryG.RESET;
                            DetGSTLedgerEntryG.SETRANGE("Document Type", DetGSTLedgerEntryG."Document Type"::Invoice);
                            DetGSTLedgerEntryG.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                            DetGSTLedgerEntryG.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
                            IF DetGSTLedgerEntryG.FINDSET THEN
                                REPEAT
                                    GSTAmountS += ABS(DetGSTLedgerEntryG."GST Amount");
                                UNTIL DetGSTLedgerEntryG.NEXT = 0;

                        end;

                    }
                }
                trigger OnAfterGetRecord();

                begin
                    FrieghtCharge := 0;
                    /*  PostedStructureOrderDetails.Reset;
                      PostedStructureOrderDetails.SetRange(Type, PostedStructureOrderDetails.Type::Sale);
                      PostedStructureOrderDetails.SetRange("Document Type", PostedStructureOrderDetails."document type"::Invoice);
                      PostedStructureOrderDetails.SetRange("Invoice No.", "Sales Invoice Line"."Document No.");
                      PostedStructureOrderDetails.SetRange("Tax/Charge Type", PostedStructureOrderDetails."tax/charge type"::Charges);
                      PostedStructureOrderDetails.SetRange("Tax/Charge Group", 'FREIGHT');
                      if PostedStructureOrderDetails.FindFirst then
                          FrieghtCharge := PostedStructureOrderDetails."Amount (LCY)";*///Ys Report Table is removed

                end;

            }
            trigger OnPreDataItem();
            begin
                SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                SetRange("Location Code", LocationCode);
                if CustomerPosgroup <> '' then
                    SetRange("Customer Posting Group", CustomerPosgroup);
            end;

            trigger OnAfterGetRecord();
            begin
                Zone := '';
                RecState.Reset;
                RecState.SetRange(Code, "Sales Invoice Header"."GST Bill-to State Code");
                if RecState.FindFirst then begin
                    Zone := RecState."State Code for TIN";
                end;
                CustomerGrouppMV := COMPANYNAME;

                PlaceOfSupplyPMV := '';
                if RecState.Get("Sales Invoice Header"."GST Bill-to State Code") then
                    PlaceOfSupplyPMV := RecState.Description
                else
                    if RecState.Get("Sales Invoice Header"."GST Ship-to State Code") then
                        PlaceOfSupplyPMV := RecState.Description;

            end;

        }
    }

    requestpage
    {


        SaveValues = false;
        layout
        {
            area(content)
            {
                field("Location Code"; LocationCode)
                {
                    ApplicationArea = Basic;
                    TableRelation = Location.Code where("Use As In-Transit" = filter(false));
                }
                field("Start Date"; StartDate)
                {
                    ApplicationArea = Basic;
                    ClosingDates = true;
                    MultiLine = false;
                }
                field("End Date"; EndDate)
                {
                    ApplicationArea = Basic;
                }
                field("Customer Group"; CustomerPosgroup)
                {
                    ApplicationArea = Basic;
                    TableRelation = "Customer Posting Group";
                }

            }
        }

        actions
        {
        }
    }



    var
        GSTAmountS: Decimal;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        AmttoCustomer: decimal;
        CustomerGroup: Code[100];
        Customer: Record Customer;
        Customer2: Record Customer;
        CustomerName: Text;
        SalesShipmentLine: Record "Sales Shipment Line";
        BagsNo: Decimal;
        GSTAmount: Decimal;
        TotalAmount: Decimal;
        StartDate: Date;
        EndDate: Date;
        SNo: Integer;
        RecState: Record State;
        PlaceOfSupply: Text;
        PlaceOfSupplyPMV: Text;
        CustomerGrouppMV: Code[100];
        PostDate: Date;
        LocationCode: Code[20];
        FrieghtCharge: Decimal;
        OnlyInvoice: Boolean;
        BISDevelopment: Codeunit "BIS Development";
        BagsNo2: Decimal;
        InvNo: Code[50];
        ValueEntry: Record "Value Entry";
        ILE: Record "Item Ledger Entry";
        GSTRate: Decimal;
        UnitRate: Decimal;
        JWCharge: Decimal;
        CustomerPosgroup: Code[10];
        Zone: Code[10];
        Zone1: Code[10];
        RecmState: Record State;


}

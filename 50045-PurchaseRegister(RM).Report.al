/// <summary>
/// Report Purchase Register (RM) (ID 50045).
/// </summary>
Report 50045 "Purchase Register (RM)"
{
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = PrintLayout;
    RDLCLayout = './Report/50045-Purc.Register(RM).rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = sorting("No.") where("Entry Type" = filter(RM | UB | SAB | "OTHER JOBWORK" | "RM/CF"), "Exclude Entry" = filter(false));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(No_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
            {
            }
            column(PostingDate_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Date")
            {
            }
            column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
            {
            }
            column(OrderDate_PurchRcptHeader; "Purch. Rcpt. Header"."Order Date")
            {
            }
            column(bill_challanno; bill_challanno)
            {
            }
            column(bill_challandate; bill_challandate)
            {
            }
            column(PaytoName_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Name")
            {
            }
            column(BuyfromCity_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from City")
            {
            }
            column(VehicleNo_PurchRcptHeader; "Purch. Rcpt. Header"."Vehicle No1.")
            {
            }
            column(ActualSupplier_PostedQualityHeader; Actualsupplier)
            {
            }
            column(ActualSupplierAddress_PostedQualityHeader; Actualsupplieradd)
            {
            }
            column(ActualSupplierAddress2_PostedQualityHeader; Actualsupplieradd2)
            {
            }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No."), "Buy-from Vendor No." = field("Buy-from Vendor No.");
                DataItemTableView = sorting("Document No.", "Line No.") where(Quantity = filter(<> 0));
                RequestFilterFields = Type, "No.";
                column(tcw_standard; tcw_standard)
                {
                }
                column(tcw_actual; tcw_actual)
                {
                }
                column(tcw_actualDec; tcw_actualDec)
                {
                }
                column(fm_standard; fm_standard)
                {
                }
                column(fm_actual; fm_actual)
                {
                }
                column(wht_standard; wht_standard)
                {
                }
                column(wht_actual; wht_actual)
                {
                }
                column(bk_standard; bk_standard)
                {
                }
                column(bk_actual; bk_actual)
                {
                }
                column(ig_standard; ig_standard)
                {
                }
                column(ig_actual; ig_actual)
                {
                }
                column(dh_standard; dh_standard)
                {
                }
                column(dh_actual; dh_actual)
                {
                }
                column(thn_standard; thn_standard)
                {
                }
                column(thn_actual; thn_actual)
                {
                }
                column(mois_standard; mois_standard)
                {
                }
                column(mois_actual; mois_actual)
                {
                }
                column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                {
                }
                column(NoofBags_PurchRcptLine; "Purch. Rcpt. Line"."No. of Bags")
                {
                }
                column(ExcessQty; ExcessQty)
                {
                }
                column(ShortQty; ShortQty)
                {
                }
                column(QtyPayable; QtyPayable)
                {
                }
                column(DirectUnitCost_PurchRcptLine; "Purch. Rcpt. Line"."Direct Unit Cost")
                {
                }
                column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                {
                }
                column(QtytoAccept_PurchRcptLine; "Purch. Rcpt. Line"."Qty to Accept")
                {
                }
                column(Shortage_PurchRcptLine; "Purch. Rcpt. Line".Shortage)
                {
                }
                column(Bill_Amt; ROUND("Purch. Rcpt. Line"."Direct Unit Cost" * "Purch. Rcpt. Line".Quantity, 0.01, '='))
                {
                }
                column(wt_deduction; ROUND("Purch. Rcpt. Line"."Direct Unit Cost" * ShortQty, 0.01, '='))
                {
                }
                column(DocumentNo_PurchRcptLine; "Purch. Rcpt. Line"."Document No.")
                {
                }
                column(OrderNo_PurchRcptLine; "Purch. Rcpt. Line"."Order No.")
                {
                }
                column(PostingDate_PurchRcptLine; "Purch. Rcpt. Line"."Posting Date")
                {
                }
                column(InwordRMPrice_PurchRcptLine; "Purch. Rcpt. Line"."Inward RM Price")
                {
                }
                trigger OnAfterGetRecord();
                begin
                    QtyPayable := 0;
                    if "Purch. Rcpt. Line".Quantity > "Purch. Rcpt. Line"."Qty to Accept" then
                        QtyPayable := "Purch. Rcpt. Line"."Qty to Accept"
                    else
                        if "Purch. Rcpt. Line".Quantity < "Purch. Rcpt. Line"."Qty to Accept" then
                            QtyPayable := "Purch. Rcpt. Line".Quantity
                        else
                            QtyPayable := "Purch. Rcpt. Line".Quantity;
                    ShortQty := 0;
                    ExcessQty := 0;
                    if "Purch. Rcpt. Line".Quantity > "Purch. Rcpt. Line"."Qty to Accept" then
                        ShortQty := ("Purch. Rcpt. Line"."Qty to Accept" - "Purch. Rcpt. Line".Quantity) * -1
                    else
                        ExcessQty := "Purch. Rcpt. Line"."Qty to Accept" - "Purch. Rcpt. Line".Quantity;
                    tcw_standard := '';
                    tcw_actual := '';
                    fm_standard := '';
                    fm_actual := '';
                    wht_standard := '';
                    wht_actual := '';
                    bk_standard := '';
                    bk_actual := '';
                    ig_standard := '';
                    ig_actual := '';
                    dh_standard := '';
                    dh_actual := '';
                    thn_standard := '';
                    thn_actual := '';
                    mois_standard := '';
                    mois_actual := '';
                    fm_Deduction := 0;
                    tcw_actualDec := 0;
                    tcw_DeductionAmt := 0;
                    tcw_stndrdDec := 0;
                    Rec_Postedqltyline.Reset;
                    Rec_Postedqltyline.SetRange(Rec_Postedqltyline."Document No.", "Purch. Rcpt. Line"."Document No.");
                    if Rec_Postedqltyline.FindSet(true, true) then begin
                        repeat
                            if Rec_Postedqltyline."Test Code" = 1 then begin
                                tcw_standard := Rec_Postedqltyline.Required;
                                tcw_actual := Rec_Postedqltyline.Actual;
                                tcw_actualDec := BISDevelopment.TextChangeToNumeric(tcw_actual);
                                tcw_stndrdDec := BISDevelopment.TextChangeToNumeric(tcw_standard);
                            end;
                            if tcw_standard > tcw_actual then;
                            if Rec_Postedqltyline."Test Code" = 2 then begin
                                fm_standard := Rec_Postedqltyline.Required;
                                fm_actual := Rec_Postedqltyline.Actual;
                            end;
                            if Rec_Postedqltyline."Test Code" = 3 then begin
                                wht_standard := Rec_Postedqltyline.Required;
                                wht_actual := Rec_Postedqltyline.Actual;
                            end;
                            if Rec_Postedqltyline."Test Code" = 4 then begin
                                bk_standard := Rec_Postedqltyline.Required;
                                bk_actual := Rec_Postedqltyline.Actual;
                            end;
                            if Rec_Postedqltyline."Test Code" = 5 then begin
                                ig_standard := Rec_Postedqltyline.Required;
                                ig_actual := Rec_Postedqltyline.Actual;
                            end;
                            if Rec_Postedqltyline."Test Code" = 6 then begin
                                dh_standard := Rec_Postedqltyline.Required;
                                dh_actual := Rec_Postedqltyline.Actual;
                            end;
                            if Rec_Postedqltyline."Test Code" = 7 then begin
                                thn_standard := Rec_Postedqltyline.Required;
                                thn_actual := Rec_Postedqltyline.Actual;
                            end;
                            if Rec_Postedqltyline."Test Code" = 8 then begin
                                mois_standard := Rec_Postedqltyline.Required;
                                mois_actual := Rec_Postedqltyline.Actual;
                            end;
                        until Rec_Postedqltyline.Next = 0;
                    end;
                end;

            }
            trigger OnPreDataItem();
            begin
                SetRange("Purch. Rcpt. Header"."Posting Date", startdate, enddate);
                if LocationCode <> '' then
                    SetRange("Purch. Rcpt. Header"."Location Code", LocationCode);
            end;

            trigger OnAfterGetRecord();
            begin
                bill_challanno := '';
                bill_challandate := 0D;
                if "Purch. Rcpt. Header"."Bill No." = '' then
                    bill_challanno := "Purch. Rcpt. Header"."Challan No."
                else
                    bill_challanno := "Purch. Rcpt. Header"."Bill No.";
                if "Purch. Rcpt. Header"."Bill Date" = 0D then
                    bill_challandate := "Purch. Rcpt. Header"."Challan Date"
                else
                    bill_challandate := "Purch. Rcpt. Header"."Bill Date";
                Actualsupplier := '';
                Actualsupplieradd := '';
                Actualsupplieradd2 := '';
                Rec_PostedQUalityHdr.Reset;
                Rec_PostedQUalityHdr.SetRange("Document No.", "No.");
                if Rec_PostedQUalityHdr.FindFirst then begin
                    Actualsupplier := Rec_PostedQUalityHdr."Actual Supplier";
                    Actualsupplieradd := Rec_PostedQUalityHdr."Actual Supplier Address";
                    Actualsupplieradd2 := Rec_PostedQUalityHdr."Actual Supplier Address 2";
                end;
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
                group(Options)
                {
                    field("Location Code"; LocationCode)
                    {
                        ApplicationArea = Basic;
                        TableRelation = Location.Code;
                    }
                    field("Start Date"; startdate)
                    {
                        ApplicationArea = Basic;
                    }
                    field("End Date"; enddate)
                    {
                        ApplicationArea = Basic;
                    }

                }
            }
        }

        actions
        {
        }
    }


    var
        Rec_Postedqltyline: Record "Posted Quality Line";
        startdate: Date;
        enddate: Date;
        bill_challanno: Text[50];
        bill_challandate: Date;
        tcw_standard: Text[150];
        tcw_actual: Text[150];
        fm_standard: Text[150];
        fm_actual: Text[150];
        fm_AmtDeducted: Decimal;
        wht_standard: Text[150];
        wht_actual: Text[150];
        wht_AmtDeducted: Decimal;
        bk_standard: Text[150];
        bk_actual: Text[150];
        ig_standard: Text[150];
        ig_actual: Text[150];
        dh_standard: Text[150];
        dh_actual: Text[150];
        thn_standard: Text[150];
        thn_actual: Text[150];
        mois_standard: Text[150];
        mois_actual: Text[150];
        Rec_PostedQUalityHdr: Record "Posted Quality Header";
        Actualsupplier: Text[50];
        Actualsupplieradd: Text[50];
        Actualsupplieradd2: Text[50];
        QtyPayable: Decimal;
        LocationCode: Code[20];
        ExcessQty: Decimal;
        ShortQty: Decimal;
        fm_Deduction: Decimal;
        BISDevelopment: Codeunit "BIS Development";
        tcw_actualDec: Decimal;
        tcw_DeductionAmt: Decimal;
        tcw_stndrdDec: Decimal;


}

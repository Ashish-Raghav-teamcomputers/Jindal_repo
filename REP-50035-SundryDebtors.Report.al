report 50035 "Sundry Debtors"
{
    DefaultLayout = RDLC;
    RDLCLayout = '.\ReportLayout\SundryDebtors2.rdl';
    Caption = 'Customer - Balance to Date';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;


    dataset
    {
        dataitem("Range Filter"; 50021)
        {
            DataItemTableView = SORTING("Entry No");
            column(compInfo; compInfo.Name)
            {

            }
            column(EntryNo_RangeFilter; "Range Filter"."Entry No")
            {
            }
            column(ToDays_RangeFilter; "Range Filter"."To Days")
            {
            }
            column(FromDays_RangeFilter; "Range Filter"."From Days")
            {
            }
            dataitem(Customer; 18)
            {
                DataItemTableView = SORTING("No.");
                PrintOnlyIfDetail = true;
                RequestFilterFields = "No.", "Search Name", Blocked;
                column(TodayFormatted; FORMAT(TODAY, 0, 4))
                {
                }
                column(TxtCustGeTranmaxDtFilter; STRSUBSTNO(Text000, FORMAT(GETRANGEMAX("Date Filter"))))
                {
                }
                column(CompanyName; COMPANYNAME)
                {
                }
                column(PrintOnePrPage; PrintOnePrPage)
                {
                }
                column(CustFilter; CustFilter)
                {
                }
                column(PrintAmountInLCY; PrintAmountInLCY)
                {
                }
                column(CustTableCaptCustFilter; TABLECAPTION + ': ' + CustFilter)
                {
                }
                column(No_Customer; "No.")
                {
                }
                column(Name_Customer; Name)
                {
                }
                column(PhoneNo_Customer; "Phone No.")
                {
                    IncludeCaption = true;
                }
                column(CustBalancetoDateCaption; CustBalancetoDateCaptionLbl)
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(AllamtsareinLCYCaption; AllamtsareinLCYCaptionLbl)
                {
                }
                column(CustLedgEntryPostingDtCaption; CustLedgEntryPostingDtCaptionLbl)
                {
                }
                column(OriginalAmtCaption; OriginalAmtCaptionLbl)
                {
                }
                // column(HQ_Customer; Customer.HQ) //17141
                column(HQ_Customer; '')
                {
                }
                dataitem(CustLedgEntry3; 21)
                {
                    DataItemTableView = SORTING("Entry No.")
                                        ORDER(Ascending);
                    // column(sectionname; CustLedgEntry3."Section Code")   //17141
                    column(sectionname; '')
                    {
                    }
                    column(divisiongroup; divisiongroup)
                    {
                    }
                    column(DivCode; DivCode)
                    {
                    }
                    // column(HQCode_CustLedgEntry3; CustLedgEntry3."HQ Code")  //17141
                    column(HQCode_CustLedgEntry3; '')
                    {
                    }
                    column(PostingDt_CustLedgEntry; "Posting Date")
                    {
                    }
                    column(DocType_CustLedgEntry; "Document Type")
                    {
                        IncludeCaption = true;
                    }
                    column(DocNo_CustLedgEntry; "Document No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Desc_CustLedgEntry; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(OriginalAmt; OriginalAmt)
                    {
                        AutoFormatExpression = CurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(EntryNo_CustLedgEntry; "Entry No.")
                    {
                        IncludeCaption = true;
                    }
                    column(RemainingAmt_Curr; RemainingAmt_Curr)
                    {
                    }
                    column(CatDesc; CatDesc)
                    {
                    }
                    column(CurrencyCode_N; CurrencyCode_N)
                    {
                    }
                    column(CurrencyCode; CurrencyCode)
                    {
                    }
                    column(Posting_Date; CustLedgEntry3."Posting Date")
                    {
                    }
                    column(Document_No; CustLedgEntry3."Document No.")
                    {
                    }
                    column(Doc_Type; CustLedgEntry3."Document Type")
                    {
                    }
                    column(Cust_No; CustName)
                    {
                    }
                    column(FinalPayterm; FinalPayterm)
                    {

                    }
                    column(Amount; CustLedgEntry3."Amount (LCY)")
                    {
                    }
                    column(Due_Date; CustLedgEntry3."Due Date")
                    {
                    }
                    column(OverDays; OverDays)
                    {
                    }
                    column(RemaingAmt; CustLedgEntry3."Remaining Amt. (LCY)")
                    {
                    }
                    column(CurrentAmt; CurrentAmt)
                    {
                    }
                    column(CurrentAmt1; CurrentAmt1)
                    {
                    }
                    column(Branch_Code; CustLedgEntry3."Global Dimension 1 Code")
                    {
                    }
                    column(BrchName; BrchName)
                    {
                    }
                    column(Amt; Amt)
                    {
                    }
                    column(DivName; DivName)
                    {
                    }
                    column(SalesPersonName; SalesPersonName)
                    {
                    }
                    column(HideColumn; HideColumn)
                    {
                    }
                    column(CustomerNo_CustLedgerEntry; CustLedgEntry3."Customer No.")
                    {
                    }
                    column(currenttotal; CurrentTotal)
                    {
                    }
                    column(TotalAmt; TotalAmt)
                    {
                    }
                    column(TotalAmtCol; TotalColumn["Range Filter"."Entry No"])
                    {
                    }
                    column(DecTotalCol; DecTotalCol["Range Filter"."Entry No"])
                    {
                    }
                    //  column(PaymentType; CustLedgEntry3."Payment Type") //17141
                    column(PaymentType; '')
                    {
                    }
                    column(ShowSubTotal; ShowSubTotal)
                    {
                    }
                    column(External; CustLedgEntry3."External Document No.")
                    {
                    }
                    column(DocumentDate_CustLedgEntry3; CustLedgEntry3."Document Date")
                    {
                    }
                    column(Number; Number)
                    {
                    }
                    column(preparedby; preparedby)
                    {
                    }
                    column(relatednon; relatednon)
                    {
                    }
                    column(CustomerPostingGroup_CustLedgEntry3; CustLedgEntry3."Customer Posting Group")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        //IF ("Document No." = 'BB16/EI/00027')  OR ("Document No." = 'BB16/EI/00031') OR ("Document No." = 'MM16/PBR/00303') OR ("Document No." = 'MM16/PBR/00305') THEN
                        //    CurrReport.SKIP;
                        //Team::6130::090920::As per Gautam's Mail
                        IF "Document No." = 'NN19SDN5' THEN
                            CurrReport.SKIP;

                        IF PrintAmountInLCY THEN BEGIN
                            CALCFIELDS("Original Amt. (LCY)", "Remaining Amt. (LCY)");
                            CALCFIELDS("Original Amount", "Remaining Amount");
                            OriginalAmt := "Original Amt. (LCY)";
                            RemainingAmt := "Remaining Amt. (LCY)";
                            CurrencyCode := '';
                            RemainingAmt_Curr := "Remaining Amount";
                            CurrencyCode_N := "Currency Code";
                        END ELSE BEGIN
                            CALCFIELDS("Original Amount", "Remaining Amount");
                            OriginalAmt := "Original Amount";
                            RemainingAmt := "Remaining Amount";
                            CurrencyCode := "Currency Code";
                        END;

                        CurrencyTotalBuffer.UpdateTotal(
                          CurrencyCode,
                          RemainingAmt,
                          0,
                          Counter1);

                        DivCode := '';
                        GLER.RESET;
                        GLER.SETRANGE("Posting Date", 0D, MaxDate);
                        GLER.SETFILTER("G/L Account No.", '%1|%2|%3|%4', '22-051100', '22-051200', '22-052100', '22-052200');
                        GLER.SETRANGE("Document No.", CustLedgEntry3."Document No.");
                        IF GLER.FINDFIRST THEN
                            DivCode := GLER."Global Dimension 2 Code";

                        CatDesc := 'Trading';
                        GLECat.RESET;
                        GLECat.SETRANGE("Document No.", "Document No.");
                        GLECat.SETFILTER("G/L Account No.", '%1|%2|%3|%4|%5|%6', '44-011010', '44-012010', '44-016010', '44-017010', '44-018010', '44-018020');
                        IF NOT GLECat.FINDFIRST THEN
                            CatDesc := 'Non-Trading';

                        IF RemainingAmt <> 0 THEN
                            OriginalAmt := RemainingAmt;
                        //17141
                        // IF ExcludeAdvance = TRUE THEN
                        //     IF CustLedgEntry3."Payment Type" = CustLedgEntry3."Payment Type"::Advance THEN
                        //         CurrReport.SKIP;

                        // IF OtherThanAdvance = TRUE THEN
                        //     IF CustLedgEntry3."Payment Type" <> CustLedgEntry3."Payment Type"::Advance THEN
                        //         CurrReport.SKIP;
                        //17141
                        CLEAR(BrchName);
                        DimVal.RESET;
                        DimVal.SETRANGE(DimVal.Code, CustLedgEntry3."Global Dimension 1 Code");
                        IF DimVal.FINDFIRST THEN
                            BrchName := DimVal.Name;

                        CLEAR(DivName);
                        CLEAR(divisiongroup);
                        DimVal.RESET;
                        DimVal.SETRANGE(DimVal.Code, CustLedgEntry3."Global Dimension 2 Code");
                        IF DimVal.FINDFIRST THEN BEGIN
                            DivName := DimVal.Name;
                            // divisiongroup := DimVal."Dimension Group";       //17141
                            divisiongroup := '';
                        END;
                        CLEAR(SalesPersonName);
                        RecSalesPerson.RESET;
                        RecSalesPerson.SETRANGE(RecSalesPerson.Code, CustLedgEntry3."Salesperson Code");
                        IF RecSalesPerson.FINDFIRST THEN
                            SalesPersonName := RecSalesPerson.Name;
                        IF Cust.GET(CustLedgEntry3."Customer No.") THEN
                            CustName := Cust."Search Name";

                        //Payterm_Start
                        FinalPayterm := '';
                        PaytermInv := '';
                        PaytermCr := '';
                        SalesInvHdrR.RESET;
                        SalesInvHdrR.SETRANGE("No.", "Document No.");
                        IF SalesInvHdrR.FINDFIRST THEN
                            PaytermInv := SalesInvHdrR."Payment Terms Code";
                        SalesCrMemoHdrR.RESET;
                        SalesCrMemoHdrR.SETRANGE("No.", "Document No.");
                        IF SalesCrMemoHdrR.FINDFIRST THEN
                            PaytermCr := SalesCrMemoHdrR."Payment Terms Code";
                        IF NOT (PaytermInv = '') THEN
                            FinalPayterm := PaytermInv
                        ELSE
                            FinalPayterm := PaytermCr;
                        //Payterm_End
                        //CustLedgEntry3.CALCFIELDS(CustLedgEntry3."Section Code");
                        // sectionname:=CustLedgEntry3."Section Code";
                        CLEAR(preparedby);
                        users.RESET;
                        users.SETRANGE(users."User Name", CustLedgEntry3."User ID");
                        IF users.FINDFIRST THEN
                            preparedby := users."Full Name";

                        IF CustLedgEntry3."Customer Posting Group" <> '' THEN BEGIN
                            relatednon := '';
                            IF (CustLedgEntry3."Customer Posting Group" = 'DOM-RP-TR') OR (CustLedgEntry3."Customer Posting Group" = 'FOR-RP-TR') THEN
                                relatednon := 'Related Party'
                            ELSE
                                relatednon := 'Non-Related Party'
                        END;

                        OverDays := 0;
                        CurrentAmt := 0;
                        IF CustLedgEntry3."Due Date" <> 0D THEN
                            OverDays := MaxDate - CustLedgEntry3."Due Date";
                        CurrentAmt := 0;
                        CurrentAmt1 := 0;
                        CurrentAmt1 := OriginalAmt;
                        TotalAmt += CurrentAmt1;

                        // IF NOT TobeDue THEN BEGIN
                        // IF (OverDays <= 0) THEN BEGIN
                        //     CurrentAmt := OriginalAmt;
                        //     CurrentTotal += CurrentAmt;
                        // END;
                        // END;
                        // IF TobeDue THEN BEGIN
                        // IF (OverDays >= 0) THEN BEGIN
                        CurrentAmt := OriginalAmt;
                        CurrentTotal += CurrentAmt;
                        // END;
                        // END;

                        TotalColumn["Range Filter"."Entry No"] := 0;

                        // IF NOT TobeDue THEN BEGIN
                        // IF (OverDays >= "Range Filter"."From Days") AND (OverDays <= "Range Filter"."To Days") THEN BEGIN
                        //     Amt1 += OriginalAmt;
                        //     TotalColumn["Range Filter"."Entry No"] := OriginalAmt;
                        //     // END;
                        // END;

                        // IF (TobeDue) AND (OverDays <= 0) THEN BEGIN
                        IF (ABS(OverDays) >= "Range Filter"."From Days") AND (ABS(OverDays) <= "Range Filter"."To Days") THEN BEGIN
                            Amt1 += OriginalAmt;
                            TotalColumn["Range Filter"."Entry No"] := OriginalAmt;
                            // END;
                        END;

                        DecTotalCol["Range Filter"."Entry No"] += TotalColumn["Range Filter"."Entry No"];
                        OriginalAmt := 0;
                    end;

                    trigger OnPreDataItem()
                    begin
                        RESET;
                        DtldCustLedgEntry.SETCURRENTKEY("Customer No.", "Posting Date", "Entry Type");
                        DtldCustLedgEntry.SETRANGE("Customer No.", Customer."No.");
                        DtldCustLedgEntry.SETRANGE("Posting Date", CALCDATE('<+1D>', MaxDate), 99991231D);
                        DtldCustLedgEntry.SETRANGE("Entry Type", DtldCustLedgEntry."Entry Type"::Application);
                        IF NOT PrintUnappliedEntries THEN
                            DtldCustLedgEntry.SETRANGE(Unapplied, FALSE);

                        IF DtldCustLedgEntry.FIND('-') THEN
                            REPEAT
                                "Entry No." := DtldCustLedgEntry."Cust. Ledger Entry No.";
                                MARK(TRUE);
                            UNTIL DtldCustLedgEntry.NEXT = 0;

                        SETCURRENTKEY("Customer No.", Open);
                        SETRANGE("Customer No.", Customer."No.");
                        SETRANGE(Open, TRUE);
                        //SETRANGE("Posting Date",0D,MaxDate);
                        SETRANGE("Posting Date", MinDate, MaxDate);

                        IF FIND('-') THEN
                            REPEAT
                                MARK(TRUE);
                            UNTIL NEXT = 0;

                        SETCURRENTKEY("Entry No.");
                        SETRANGE(Open);
                        MARKEDONLY(TRUE);

                        IF salespersoncode <> '' THEN
                            SETRANGE("Salesperson Code", salespersoncode);
                        IF duedate <> 0D THEN
                            SETRANGE("Due Date", 0D, duedate);
                        //SETRANGE("Date Filter",0D,MaxDate);
                        SETRANGE("Date Filter", MinDate, MaxDate);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    IF MaxDate = 0D THEN
                        ERROR(BlankMaxDateErr);

                    //SETRANGE("Date Filter",0D,MaxDate);
                    SETRANGE("Date Filter", MinDate, MaxDate);
                    CALCFIELDS("Net Change (LCY)", "Net Change");

                    /*
                    IF ((PrintAmountInLCY AND ("Net Change (LCY)" = 0)) OR
                        ((NOT PrintAmountInLCY) AND ("Net Change" = 0)))
                    THEN
                      CurrReport.SKIP;
                      */

                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.NEWPAGEPERRECORD := PrintOnePrPage;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                DecTotalCol["Range Filter"."Entry No"] := 0;
                CurrentTotal := 0;
                TotalAmt := 0;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("Starting Date"; MinDate)
                    {
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Ending Date"; MaxDate)
                    {
                        Caption = 'Ending Date';
                        ApplicationArea = All;
                    }
                    field(PrintAmountInLCY; PrintAmountInLCY)
                    {
                        Caption = 'Show Amounts in LCY';
                        ApplicationArea = All;
                    }
                    field(PrintUnappliedEntries; PrintUnappliedEntries)
                    {
                        Caption = 'Include Unapplied Entries';
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Hide column"; HideColumn)
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("Show Sub Total"; ShowSubTotal)
                    {
                        ApplicationArea = All;
                        Visible = false;

                    }
                    field("Exclude Advance"; ExcludeAdvance)
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("Only Advance"; OtherThanAdvance)
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field(SalesPerson; salespersoncode)
                    {
                        TableRelation = "Salesperson/Purchaser".Code;
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("On Due Date"; duedate)
                    {
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Future Cash Flow"; TobeDue)
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        compInfo.Get();
        CustFilter := Customer.GETFILTERS;
        CustDateFilter := Customer.GETFILTER("Date Filter");

        Number := RangeFilterR.COUNT;
    end;

    var
        compInfo: Record "Company Information";
        Text000: Label 'Balance on %1';
        CurrencyTotalBuffer: Record 332 temporary;
        CurrencyTotalBuffer2: Record 332 temporary;
        DtldCustLedgEntry: Record 379;
        PrintAmountInLCY: Boolean;
        PrintOnePrPage: Boolean;
        CustFilter: Text;
        CustDateFilter: Text[30];
        MaxDate: Date;
        MinDate: Date;
        OriginalAmt: Decimal;
        Amt: Decimal;
        RemainingAmt: Decimal;
        Counter1: Integer;
        DtldCustLedgEntryNum: Integer;
        OK: Boolean;
        CurrencyCode: Code[10];
        PrintUnappliedEntries: Boolean;
        CustBalancetoDateCaptionLbl: Label 'Customer - Balance to Date';
        CurrReportPageNoCaptionLbl: Label 'Page';
        AllamtsareinLCYCaptionLbl: Label 'All amounts are in LCY.';
        CustLedgEntryPostingDtCaptionLbl: Label 'Posting Date';
        OriginalAmtCaptionLbl: Label 'Amount';
        TotalCaptionLbl: Label 'Total';
        BlankMaxDateErr: Label 'Ending Date must have a value.';
        "-----------TEAM::3333---------------": Integer;
        OverDays: Integer;
        Cust: Record 18;
        DimVal: Record 349;
        BrchName: Text[100];
        CurrentAmt: Decimal;
        Amt1: Decimal;
        RecRange: Record 50018;
        ShowValue: Boolean;
        DivName: Text[100];
        SalesPersonName: Text[100];
        RecSalesPerson: Record 13;
        CustName: Text[200];
        HideColumn: Boolean;
        CurrentTotal: Decimal;
        CLE: Record 21;
        TotalAmt: Decimal;
        TotalColumn: array[10] of Decimal;
        DecTotalCol: array[10] of Decimal;
        CurrentAmt1: Decimal;
        ShowSubTotal: Boolean;
        Number: Integer;
        RangeFilterR: Record 50018;
        ExcludeAdvance: Boolean;
        OtherThanAdvance: Boolean;
        preparedby: Text[100];
        users: Record 2000000120;
        sectionname: Code[20];
        salespersoncode: Code[10];
        duedate: Date;
        relatednon: Text;
        divisiongroup: Text[100];
        CurrencyCode_N: Code[10];
        RemainingAmt_Curr: Decimal;
        TobeDue: Boolean;
        DivCode: Code[20];
        GLER: Record 17;
        CatDesc: Text[20];
        GLECat: Record 17;
        PaytermInv: Text[30];
        PaytermCr: Text[30];
        FinalPayterm: Text[30];
        SalesInvHdrR: Record "Sales Invoice Header";
        SalesCrMemoHdrR: Record "Sales Cr.Memo Header";

    [Scope('Internal')]
    procedure InitializeRequest(NewPrintAmountInLCY: Boolean; NewPrintOnePrPage: Boolean; NewPrintUnappliedEntries: Boolean; NewEndingDate: Date)
    begin
        PrintAmountInLCY := NewPrintAmountInLCY;
        PrintOnePrPage := NewPrintOnePrPage;
        PrintUnappliedEntries := NewPrintUnappliedEntries;
        MaxDate := NewEndingDate;
    end;
}


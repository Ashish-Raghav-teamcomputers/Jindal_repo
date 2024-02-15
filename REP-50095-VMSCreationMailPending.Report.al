report 50095 "VMS Creation Mail Pending"
{
    // Automatic Reminder Feature Added By - TEAM 14763
    DefaultLayout = RDLC;
    RDLCLayout = '.\ReportLayout\VMSCreationMailPending.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;


    dataset
    {
        dataitem("Purchase Header"; 38)
        {
            CalcFields = Amount;
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER(Invoice),
                                      Status = FILTER(<> "Pending Approval"),
                                      "Support Status" = FILTER(<> "Send to Support"),
                                      "VMS Order" = FILTER(true),
                                      "VMS Submittted" = FILTER(true),
                                      Rejected = FILTER(false));
            RequestFilterFields = "Posting Date";
            column(Amount_PurchaseHeader; "Purchase Header".Amount)
            { }
            column(PendingStatus; PendingStatus)
            {
            }
            column(TLName; TLUser."Full Name")
            {
            }
            column(Full_nameS; UserREC."Full Name")
            {
            }
            column(OrderDate_PurchaseHeader; "Purchase Header"."Order Date")
            {
            }
            column(VhdNoDays; VhdNoDays)
            {
            }
            column(TLNoDays; ABS(TLNoDays))
            {
            }
            column(CHNoDays; CHNoDays)
            {
            }
            column(FinanceNoDays; FinanceNoDays)
            {
            }
            column(filters; GETFILTERS)
            {
            }
            column(No_PurchaseHeader; "No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            {
            }
            column(VendorInvoiceNo_PurchaseHeader; "Vendor Invoice No.")
            {
            }
            column(ShortcutDimension3Code_PurchaseHeader; "Shortcut Dimension 3 Code")
            {
            }
            column(DepaertName; DeptName)
            {
            }
            column(ShortcutDimension2Code_PurchaseHeader; "Shortcut Dimension 2 Code")
            {
            }
            column(ProjectName; ProjName)
            {
            }
            column(CreationDate_PurchaseHeaders; FORMAT("Creation Date"))
            {
            }
            column(PostingDate_PurchaseHeader; FORMAT("Posting Date"))
            {
            }
            column(DocumentDate_PurchaseHeader; "Document Date")
            {
            }
            column(CreationId_PurchaseHeader; "Creation Id")
            {
            }
            column(TL; "Approver 1")
            {
            }
            column(CH_PI; "Approver 2")
            {
            }
            column(AmounttoVendor_PurchaseHeader; TotalAmt + igst + cgst + sgst)//15578 Replace "Amount to Vendor"
            {
            }
            column(FinanceUserId_PurchaseHeader; "Finance User Id")
            {
            }
            column(TL_App_Status; StatusApp1)
            {
            }
            column(TL_Last_Modified_Date; StatusAppDate1)
            {
            }
            column(CH_App_Status; StatusApp2)
            {
            }
            column(CH_Last_Modified_Date; StatusAppDate2)
            {
            }
            column(Today_date; TLNoDays)
            {
            }
            column(Digitally_Signed; Digitally_Signed)
            { }
            column(HardCopy_Submitted; HardCopy_Submitted)
            { }

            trigger OnAfterGetRecord()
            begin

                //TEAM 14763 11-12-23
                Digitally_Signed := 'No';
                HardCopy_Submitted := 'No';

                IF "Purchase Header"."Digitally Signed" then begin
                    Digitally_Signed := 'Yes';
                    HardCopy_Submitted := 'No';
                end else begin
                    IF "Purchase Header"."HardCopy Received" then begin
                        Digitally_Signed := 'No';
                        HardCopy_Submitted := 'Yes';
                    end;
                end;
                //TEAM 14763 11-12-23

                CLEAR(VhdNoDays);
                CLEAR(TLNoDays);
                CLEAR(CHNoDays);
                CLEAR(FinanceNoDays);
                CLEAR(StatusApp1);
                CLEAR(StatusApp2);
                CLEAR(StatusAppDate1);
                CLEAR(StatusAppDate2);
                CLEAR(PendingStatus);

                ApprovalEntry.RESET;
                ApprovalEntry.SETRANGE("Document Type", "Document Type");
                ApprovalEntry.SETRANGE("Document No.", "No.");
                ApprovalEntry.SETRANGE("Approver ID", "Approver 1");
                ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Open);
                IF NOT ApprovalEntry.FINDFIRST THEN BEGIN
                    IF ("Purchase Header".Status = "Purchase Header".Status::Open) AND ("Purchase Header"."Support Status" = "Purchase Header"."Support Status"::Approved) THEN BEGIN
                        IF "Purchase Header"."Support Approved Date" <> 0D THEN
                            TLNoDays := ExcludeWeekOffMailSchedule("Purchase Header"."Support Approved Date");
                        PendingStatus := 'VHD to TL';
                    END;
                END;

                ApprovalEntry.RESET;
                ApprovalEntry.SETRANGE("Document Type", "Document Type");
                ApprovalEntry.SETRANGE("Document No.", "No.");
                ApprovalEntry.SETRANGE("Approver ID", "Approver 2");
                ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Approved);
                IF ApprovalEntry.FINDLAST THEN BEGIN
                    IF "Purchase Header".Status = "Purchase Header".Status::Released THEN
                        IF "Purchase Header"."VHD Submit Date" = 0D THEN BEGIN
                            TLNoDays := ExcludeWeekOffMailSchedule(DT2DATE(ApprovalEntry."Last Date-Time Modified"));
                            PendingStatus := 'VHD to Finance';
                        END;
                END;

                IF ("Purchase Header".Status = "Purchase Header".Status::Open) AND ("Purchase Header"."Approver Support" = '') THEN BEGIN
                    IF "Purchase Header"."Creation Date" <> 0D THEN
                        IF "Purchase Header"."VMS Submit Date" <> 0D then //13-02-24 Shashank.
                            TLNoDays := ExcludeWeekOffMailSchedule("Purchase Header"."VMS Submit Date")
                        else
                            TLNoDays := ExcludeWeekOffMailSchedule("Purchase Header"."Creation Date");
                    PendingStatus := 'VHD to TL';
                END;

                IF TLNoDays < 1 THEN
                    CurrReport.SKIP;

                CLEAR(DeptName);
                DeptDimensionValue.RESET;
                DeptDimensionValue.SETRANGE("Dimension Code", 'DEPT');
                DeptDimensionValue.SETRANGE(Code, "Shortcut Dimension 3 Code");
                IF DeptDimensionValue.FINDFIRST THEN
                    DeptName := DeptDimensionValue."Name 1";

                CLEAR(ProjName);
                ProjectDimensionValue.RESET;
                ProjectDimensionValue.SETRANGE("Dimension Code", 'PROJECTS');
                ProjectDimensionValue.SETRANGE(Code, "Shortcut Dimension 2 Code");
                IF ProjectDimensionValue.FINDFIRST THEN
                    ProjName := ProjectDimensionValue."Name 1";


                IF StatusApp2 = StatusApp2::Open THEN
                    CLEAR(StatusAppDate2)
                ELSE
                    StatusAppDate2 := DT2DATE(ApprovalEntry1."Last Date-Time Modified");

                UserREC.RESET;
                UserREC.SETRANGE("User Name", "Approver 2");
                IF UserREC.FINDFIRST THEN;

                TLUser.RESET;
                TLUser.SETRANGE("User Name", "Approver 1");
                IF TLUser.FINDFIRST THEN;
                IF StatusAppDate1 <> 0D THEN;

                Clear(sgst);
                Clear(igst);
                Clear(cgst);
                Clear(TotalAmt);
                ReccPurchaseLine.Reset();
                ReccPurchaseLine.SetRange("Document Type", "Purchase Header"."Document Type");
                ReccPurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
                if ReccPurchaseLine.FindSet() then
                    repeat
                        TotalAmt += ReccPurchaseLine."Line Amount";
                        GSTSetup.Get();
                        if GSTSetup."GST Tax Type" = GSTLbl then
                            if ReccPurchaseLine."GST Jurisdiction Type" = ReccPurchaseLine."GST Jurisdiction Type"::Interstate then
                                ComponentName := IGSTLbl
                            else
                                ComponentName := CGSTLbl
                        else
                            if GSTSetup."Cess Tax Type" = GSTCESSLbl then
                                ComponentName := CESSLbl;

                        if ReccPurchaseLine.Type <> ReccPurchaseLine.Type::" " then begin
                            TaxTransactionValue.Reset();
                            TaxTransactionValue.SetRange("Tax Record ID", ReccPurchaseLine.RecordId);
                            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                            if TaxTransactionValue.FindSet() then
                                repeat
                                    case TaxTransactionValue."Value ID" of
                                        6:
                                            begin
                                                sgst += abs(Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName)));
                                                GSTper3 := TaxTransactionValue.Percent;
                                            end;
                                        2:
                                            begin
                                                cgst += abs(Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName)));
                                                GSTper2 := TaxTransactionValue.Percent;
                                            end;
                                        3:
                                            begin
                                                igst += abs(Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName)));
                                                GSTper1 := TaxTransactionValue.Percent;
                                            end;
                                    end;
                                until TaxTransactionValue.Next() = 0;
                            cgstTOTAL += cgst;
                            sgstTOTAL += sgst;
                            igstTotal += igst;
                        end;
                    until ReccPurchaseLine.Next() = 0;

            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Digitally_Signed, HardCopy_Submitted : Text;
        DeptDimensionValue: Record 349;
        ProjectDimensionValue: Record 349;
        ApprovalEntry: Record 50020;
        ApprovalEntry1: Record 50020;
        PurchInvHeader: Record 122;
        SDate: Date;
        Edate: Date;

        ApprovalEntryInv: Record 50020;
        ApprovalEntry1Inv: Record 50020;
        VhdNoDays: Integer;
        TLNoDays: Integer;
        CHNoDays: Integer;
        FinanceNoDays: Integer;
        VhdNoDaysInv: Integer;
        TLNoDaysInv: Integer;
        CHNoDaysInv: Integer;
        FinanceNoDaysInv: Integer;
        StatusApp1: Option Created,Open,Canceled,Rejected,Approved;
        StatusApp2: Option Created,Open,Canceled,Rejected,Approved;
        StatusAppDate1: Date;
        StatusAppDate2: Date;
        PIApprovalEntry: Record 50020;
        Today_date: Date;
        UserREC: Record 2000000120;

        DaysSinceTL: Integer;
        Approver1: Code[50];
        TodayDateTime: DateTime;
        ApproverTime: Time;
        CurrDate: Date;
        CurrTime: Time;
        DeptCode: Code[20];
        TLUser: Record 2000000120;
        PendingStatus: Text[150];
        ProjName: Text[100];
        DeptName: Text[100];
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
        sgstTOTAL: Decimal;
        GSTLbl: Label 'GST';
        IGSTLbl: Label 'IGST';
        CGSTLbl: Label 'CGST';
        GSTCESSLbl: Label 'GST CESS';
        CESSLbl: Label 'CESS';
        igst: Decimal;
        igstTotal: Decimal;
        sgst: Decimal;
        GSTper3: Decimal;
        cgst: Decimal;
        GSTper1: Decimal;
        GSTper2: Decimal;
        cgstTOTAL: Decimal;
        TotalAmt: Decimal;
        ComponentName: Code[30];
        ReccPurchaseLine: Record "Purchase Line";


    procedure UserwiseReportCL(ApproverID: Code[50])
    begin
        DeptCode := ApproverID;
    end;


    procedure ExcludeWeekOffMailSchedule(DocumentDate: Date): Integer
    var
        FICCICalender: Record 50001;
        PurchaseHeader: Record 38;
        Day: Text[10];
        Date: Date;
        NoofDays: Integer;
        AutoMailingDays: Integer;
        PurchaseLine: Record 39;
        RecAutoReminders: Record 50014;
    begin
        RecAutoReminders.RESET;
        RecAutoReminders.SETCURRENTKEY(Date, "Weekends & Holidays");
        RecAutoReminders.SETRANGE(Date, DocumentDate + 1, TODAY - 1);
        RecAutoReminders.SETRANGE("Weekends & Holidays", FALSE);
        IF RecAutoReminders.FINDFIRST THEN
            EXIT(RecAutoReminders.COUNT);
    end;

    procedure GetGSTRoundingPrecision(ComponentName: Code[30]): Decimal
    var
        TaxComponent: Record "Tax Component";
        GSTSetup1: Record "GST Setup";
        GSTRoundingPrecision: Decimal;
    begin
        if not GSTSetup1.Get() then
            exit;
        GSTSetup1.TestField("GST Tax Type");

        TaxComponent.SetRange("Tax Type", GSTSetup1."GST Tax Type");
        TaxComponent.SetRange(Name, ComponentName);
        TaxComponent.FindFirst();
        if TaxComponent."Rounding Precision" <> 0 then
            GSTRoundingPrecision := TaxComponent."Rounding Precision"
        else
            GSTRoundingPrecision := 1;
        exit(GSTRoundingPrecision);
    end;
}


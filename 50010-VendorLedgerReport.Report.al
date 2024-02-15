/// <summary>
/// Report Vendor Ledger Report (ID 50010).
/// </summary>
Report 50010 "Vendor Ledger Report"
{
    Caption = 'Vendor Ledger Report';
    UseSystemPrinter = false;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    RDLCLayout = './Report/50010-VendorLedgerReport.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Vendor Posting Group", "Date Filter";
            column(CompanyName; CompName)
            {
            }
            column(TDS_Total; TDS_Total)
            { }
            column(Add_Compinfo; CompAdd)
            {
            }
            column(CIN_Compinfo; 'CIN' + ':-' + ' ' + Rec_CompInfor."Registration No.")
            {
            }
            column(VendDatetFilterPeriod; StrSubstNo(Text000, VendDateFilter))
            {
            }
            column(VendorTblCapVendFltr; TableCaption + ': ' + VendFilter)
            {
            }
            column(VendFilter; VendFilter)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(ExcludeBalanceOnly; ExcludeBalanceOnly)
            {
            }
            column(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
            {
            }
            column(AmountCaption; AmountCaption)
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(RemainingAmtCaption; RemainingAmtCaption)
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(txtOpnHeading; txtOpnHeading)
            {
            }
            column(No_Vendor; Vendor."No.")
            {
            }
            column(Name_Vendor; Vendor.Name)
            {
            }
            column(Address_Vendor; Address + '' + "Address 2")
            {
            }
            column(PhoneNo_Vendor; Vendor."Phone No.")
            {
                IncludeCaption = true;
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalAdjLCY; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(VendBalanceLCY; VendBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StrtBalLCYStartBalAdjLCY; (StartBalanceLCY + StartBalAdjLCY))
            {
                AutoFormatType = 1;
            }
            column(VendDetailTrialBalCap; VendDetailTrialBalCapLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(AllamountsareinLCYCaption; AllamountsareinLCYCaptionLbl)
            {
            }
            column(ReportIncludesvendorshavebalanceCaption; ReportIncludesvendorshavebalanceCaptionLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(BalanceLCYCaption; BalanceLCYCaptionLbl)
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(AdjofOpeningBalanceCaption; AdjofOpeningBalanceCaptionLbl)
            {
            }
            column(TotalLCYCaption; TotalLCYCaptionLbl)
            {
            }
            column(TotalAdjofOpenBalCaption; TotalAdjofOpenBalCaptionLbl)
            {
            }
            column(TotalLCYBeforePeriodCaption; TotalLCYBeforePeriodCaptionLbl)
            {
            }
            column(PrintNarration; PrintNarration)
            {
            }
            column(PrintDimension; PrintDimension)
            {
            }
            column(ShowCurrency; ShowCurrency)
            {
            }
            column(PrintCurrency; PrintCurrency)
            {
            }
            column(appliedentry; appliedentry)
            {
            }
            column(DebitLCY; VendDebitAmtLCY)
            {
            }
            column(CredLCY; VendCreditAmtLCY)
            {
            }
            column(DebitCurr; VendDebitAmt)
            {
            }
            column(CreditCurr; Abs(VendCreditAmt))
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Date Filter" = field("Date Filter");
                DataItemTableView = sorting("Vendor No.", "Posting Date");
                column(PostingDate_VendLedgEntry; Format("Posting Date"))
                {
                }
                column(DocumentDate_VendorLedgerEntry; Format("Document Date"))
                {
                }
                column(ExternalDocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."External Document No.")
                {
                }
                column(sno; sno)
                {
                }
                column(TDSAmt; TDSAmt)
                {
                }
                column(TDSAmt1; TDSAmt1)
                {
                }
                column(DocType_VendLedgEntry; "Vendor Ledger Entry"."Document Type")
                {
                    IncludeCaption = true;
                }
                column(DocNo_VendLedgerEntry; "Vendor Ledger Entry"."Document No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_VendLedgerEntry; "Vendor Ledger Entry".Description)
                {
                    IncludeCaption = true;
                }
                column(VendAmount; VendAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(VendBalLCY2; VendBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(VendRemainAmount; VendRemainAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(VendEntryDueDate; Format(VendEntryDueDate))
                {
                }
                column(EntryNo_VendorLedgerEntry; "Vendor Ledger Entry"."Entry No.")
                {
                    IncludeCaption = true;
                }
                column(VendCurrencyCode; VendCurrencyCode)
                {
                }
                column(Desc2; Desc2)
                {
                }
                column(DebitAmtLCY; "Debit Amount (LCY)")
                {
                }
                column(CreditAmtLCY; "Credit Amount (LCY)")
                {
                }
                column(Amount_VendorLedgerEntry; "Vendor Ledger Entry".Amount)
                {
                }
                column(OrgAmtLCY; "Original Amt. (LCY)")
                {
                }
                column(OrgAmt; "Vendor Ledger Entry"."Original Amount")
                {
                }
                column(VoucherText1; VoucherText[1])
                {
                }
                column(VoucherText2; VoucherText[2])
                {
                }
                column(VoucherText3; VoucherText[3])
                {
                }
                column(VoucherText4; VoucherText[4])
                {
                }
                column(VoucherText5; VoucherText[5])
                {
                }
                column(VoucherText6; VoucherText[6])
                {
                }
                column(VoucherText7; VoucherText[7])
                {
                }
                column(VoucherText8; VoucherText[8])
                {
                }
                column(VoucherText9; VoucherText[9])
                {
                }
                column(VoucherText10; VoucherText[10])
                {
                }
                column(CommentText1; CommentText[1])
                {
                }
                column(CommentText2; CommentText[2])
                {
                }
                column(CommentText3; CommentText[3])
                {
                }
                column(CommentText4; CommentText[4])
                {
                }
                column(CommentText5; CommentText[5])
                {
                }
                column(CommentText6; CommentText[6])
                {
                }
                column(CommentText7; CommentText[7])
                {
                }
                column(CommentText8; CommentText[8])
                {
                }
                column(CommentText9; CommentText[9])
                {
                }
                column(CommentText10; CommentText[10])
                {
                }
                column(DimText; DimText)
                {
                }
                column(dvleamt1; dvleamt[1])
                {
                }
                column(dvleamt2; dvleamt[2])
                {
                }
                column(ExternalDocNo1; ExternalDocNo[1])
                {
                }
                column(ExternalDocNo2; ExternalDocNo[2])
                {
                }
                column(ExternalDocNo3; ExternalDocNo[3])
                {
                }
                column(ExternalDocNo4; ExternalDocNo[4])
                {
                }
                column(ExternalDocNo5; ExternalDocNo[5])
                {
                }
                column(ExternalDocNo6; ExternalDocNo[6])
                {
                }
                column(ExternalDocNo7; ExternalDocNo[7])
                {
                }
                column(ExternalDocNo8; ExternalDocNo[8])
                {
                }
                column(ExternalDocNo9; ExternalDocNo[9])
                {
                }
                column(ExternalDocNo10; ExternalDocNo[10])
                {
                }
                column(ExternalDocNo11; ExternalDocNo[11])
                {
                }
                column(ExternalDocNo12; ExternalDocNo[12])
                {
                }
                column(ExternalDocNo13; ExternalDocNo[13])
                {
                }
                column(ExternalDocNo14; ExternalDocNo[14])
                {
                }
                column(ExternalDocNo15; ExternalDocNo[15])
                {
                }
                column(ExternalDocNo16; ExternalDocNo[16])
                {
                }
                column(ExternalDocNo17; ExternalDocNo[17])
                {
                }
                column(ExternalDocNo18; ExternalDocNo[18])
                {
                }
                column(ExternalDocNo19; ExternalDocNo[19])
                {
                }
                column(ExternalDocNo20; ExternalDocNo[20])
                {
                }
                column(ExternalDocNo21; ExternalDocNo[21])
                {
                }
                column(ExternalDocNo22; ExternalDocNo[22])
                {
                }
                column(ExternalDocNo23; ExternalDocNo[23])
                {
                }
                column(ExternalDocNo24; ExternalDocNo[24])
                {
                }
                column(ExternalDocNo25; ExternalDocNo[25])
                {
                }
                column(ExternalDocNo26; ExternalDocNo[26])
                {
                }
                column(ExternalDocNo27; ExternalDocNo[27])
                {
                }
                column(ExternalDocNo28; ExternalDocNo[28])
                {
                }
                column(ExternalDocNo29; ExternalDocNo[29])
                {
                }
                column(ExternalDocNo30; ExternalDocNo[30])
                {
                }
                column(ExternalDocNo31; ExternalDocNo[31])
                {
                }
                column(ExternalDocNo32; ExternalDocNo[32])
                {
                }
                column(ExternalDocNo33; ExternalDocNo[33])
                {
                }
                column(ExternalDocNo34; ExternalDocNo[34])
                {
                }
                column(ExternalDocNo35; ExternalDocNo[35])
                {
                }
                column(ExternalDocNo36; ExternalDocNo[36])
                {
                }
                column(ExternalDocNo37; ExternalDocNo[37])
                {
                }
                column(ExternalDocNo38; ExternalDocNo[38])
                {
                }
                column(ExternalDocNo39; ExternalDocNo[39])
                {
                }
                column(ExternalDocNo40; ExternalDocNo[40])
                {
                }
                column(ExternalDocNo41; ExternalDocNo[41])
                {
                }
                column(ExternalDocNo42; ExternalDocNo[42])
                {
                }
                column(ExternalDocNo43; ExternalDocNo[43])
                {
                }
                column(ExternalDocNo44; ExternalDocNo[44])
                {
                }
                column(ExternalDocNo45; ExternalDocNo[45])
                {
                }
                column(ExternalDocNo46; ExternalDocNo[46])
                {
                }
                column(ExternalDocNo47; ExternalDocNo[47])
                {
                }
                column(ExternalDocNo48; ExternalDocNo[48])
                {
                }
                column(ExternalDocNo49; ExternalDocNo[49])
                {
                }
                column(ExternalDocNo50; ExternalDocNo[50])
                {
                }
                column(ExternalDocNo51; ExternalDocNo[51])
                {
                }
                column(ExternalDocNo52; ExternalDocNo[52])
                {
                }
                column(ExternalDocNo53; ExternalDocNo[53])
                {
                }
                column(ExternalDocNo54; ExternalDocNo[54])
                {
                }
                column(ExternalDocNo55; ExternalDocNo[55])
                {
                }
                column(ExternalDocNo56; ExternalDocNo[56])
                {
                }
                column(ExternalDocNo57; ExternalDocNo[57])
                {
                }
                column(ExternalDocNo58; ExternalDocNo[58])
                {
                }
                column(ExternalDocNo59; ExternalDocNo[59])
                {
                }
                column(ExternalDocNo60; ExternalDocNo[60])
                {
                }
                column(ExternalDocNo61; ExternalDocNo[61])
                {
                }
                column(ExternalDocNo62; ExternalDocNo[62])
                {
                }
                column(ExternalDocNo63; ExternalDocNo[63])
                {
                }
                column(ExternalDocNo64; ExternalDocNo[64])
                {
                }
                column(ExternalDocNo65; ExternalDocNo[65])
                {
                }
                column(ExternalDocNo66; ExternalDocNo[66])
                {
                }
                column(ExternalDocNo67; ExternalDocNo[67])
                {
                }
                column(ExternalDocNo68; ExternalDocNo[68])
                {
                }
                column(ExternalDocNo69; ExternalDocNo[69])
                {
                }
                column(ExternalDocNo70; ExternalDocNo[70])
                {
                }
                column(dvleamt3; dvleamt[3])
                {
                }
                column(dvleamt4; dvleamt[4])
                {
                }
                column(dvleamt5; dvleamt[5])
                {
                }
                column(dvleamt6; dvleamt[6])
                {
                }
                column(dvleamt7; dvleamt[7])
                {
                }
                column(dvleamt8; dvleamt[8])
                {
                }
                column(dvleamt9; dvleamt[9])
                {
                }
                column(dvleamt10; dvleamt[10])
                {
                }
                column(dvleamt11; dvleamt[11])
                {
                }
                column(dvleamt12; dvleamt[12])
                {
                }
                column(dvleamt13; dvleamt[13])
                {
                }
                column(dvleamt14; dvleamt[14])
                {
                }
                column(dvleamt15; dvleamt[15])
                {
                }
                column(dvleamt16; dvleamt[16])
                {
                }
                column(dvleamt17; dvleamt[17])
                {
                }
                column(dvleamt18; dvleamt[18])
                {
                }
                column(dvleamt19; dvleamt[19])
                {
                }
                column(dvleamt20; dvleamt[20])
                {
                }
                column(dvleamt21; dvleamt[21])
                {
                }
                column(dvleamt22; dvleamt[22])
                {
                }
                column(dvleamt23; dvleamt[23])
                {
                }
                column(dvleamt24; dvleamt[24])
                {
                }
                column(dvleamt25; dvleamt[25])
                {
                }
                column(dvleamt26; dvleamt[26])
                {
                }
                column(dvleamt27; dvleamt[27])
                {
                }
                column(dvleamt28; dvleamt[28])
                {
                }
                column(dvleamt29; dvleamt[29])
                {
                }
                column(dvleamt30; dvleamt[30])
                {
                }
                column(dvleamt31; dvleamt[31])
                {
                }
                column(dvleamt32; dvleamt[32])
                {
                }
                column(dvleamt33; dvleamt[33])
                {
                }
                column(dvleamt34; dvleamt[34])
                {
                }
                column(dvleamt35; dvleamt[35])
                {
                }
                column(dvleamt36; dvleamt[36])
                {
                }
                column(dvleamt37; dvleamt[37])
                {
                }
                column(dvleamt38; dvleamt[38])
                {
                }
                column(dvleamt39; dvleamt[39])
                {
                }
                column(dvleamt40; dvleamt[40])
                {
                }
                column(dvleamt41; dvleamt[41])
                {
                }
                column(dvleamt42; dvleamt[42])
                {
                }
                column(dvleamt43; dvleamt[43])
                {
                }
                column(dvleamt44; dvleamt[44])
                {
                }
                column(dvleamt45; dvleamt[45])
                {
                }
                column(dvleamt46; dvleamt[46])
                {
                }
                column(dvleamt47; dvleamt[47])
                {
                }
                column(dvleamt48; dvleamt[48])
                {
                }
                column(dvleamt49; dvleamt[49])
                {
                }
                column(dvleamt50; dvleamt[50])
                {
                }
                column(dvleamt51; dvleamt[51])
                {
                }
                column(dvleamt52; dvleamt[52])
                {
                }
                column(dvleamt53; dvleamt[53])
                {
                }
                column(dvleamt54; dvleamt[54])
                {
                }
                column(dvleamt55; dvleamt[55])
                {
                }
                column(dvleamt56; dvleamt[56])
                {
                }
                column(dvleamt57; dvleamt[57])
                {
                }
                column(dvleamt58; dvleamt[58])
                {
                }
                column(dvleamt59; dvleamt[59])
                {
                }
                column(dvleamt60; dvleamt[60])
                {
                }
                column(dvleamt61; dvleamt[61])
                {
                }
                column(dvleamt62; dvleamt[62])
                {
                }
                column(dvleamt63; dvleamt[63])
                {
                }
                column(dvleamt64; dvleamt[64])
                {
                }
                column(dvleamt65; dvleamt[65])
                {
                }
                column(dvleamt66; dvleamt[66])
                {
                }
                column(dvleamt67; dvleamt[67])
                {
                }
                column(dvleamt68; dvleamt[68])
                {
                }
                column(dvleamt69; dvleamt[69])
                {
                }
                column(dvleamt70; dvleamt[70])
                {
                }
                column(dvleamt_curr1; dvleamt_curr[1])
                {
                }
                column(dvleamt_curr2; dvleamt_curr[2])
                {
                }
                column(dvleamt_curr3; dvleamt_curr[3])
                {
                }
                column(dvleamt_curr4; dvleamt_curr[4])
                {
                }
                column(dvleamt_curr5; dvleamt_curr[5])
                {
                }
                column(dvleamt_curr6; dvleamt_curr[6])
                {
                }
                column(dvleamt_curr7; dvleamt_curr[7])
                {
                }
                column(dvleamt_curr8; dvleamt_curr[8])
                {
                }
                column(dvleamt_curr9; dvleamt_curr[9])
                {
                }
                column(dvleamt_curr10; dvleamt_curr[10])
                {
                }
                column(dvleamt_curr11; dvleamt_curr[11])
                {
                }
                column(dvleamt_curr12; dvleamt_curr[12])
                {
                }
                column(dvleamt_curr13; dvleamt_curr[13])
                {
                }
                column(dvleamt_curr14; dvleamt_curr[14])
                {
                }
                column(dvleamt_curr15; dvleamt_curr[15])
                {
                }
                column(dvleamt_curr16; dvleamt_curr[16])
                {
                }
                column(dvleamt_curr17; dvleamt_curr[17])
                {
                }
                column(dvleamt_curr18; dvleamt_curr[18])
                {
                }
                column(dvleamt_curr19; dvleamt_curr[19])
                {
                }
                column(dvleamt_curr20; dvleamt_curr[20])
                {
                }
                column(dvleamt_curr21; dvleamt_curr[21])
                {
                }
                column(dvleamt_curr22; dvleamt_curr[22])
                {
                }
                column(dvleamt_curr23; dvleamt_curr[23])
                {
                }
                column(dvleamt_curr24; dvleamt_curr[24])
                {
                }
                column(dvleamt_curr25; dvleamt_curr[25])
                {
                }
                column(dvleamt_curr26; dvleamt_curr[26])
                {
                }
                column(dvleamt_curr27; dvleamt_curr[27])
                {
                }
                column(dvleamt_curr28; dvleamt_curr[28])
                {
                }
                column(dvleamt_curr29; dvleamt_curr[29])
                {
                }
                column(dvleamt_curr30; dvleamt_curr[30])
                {
                }
                column(dvleamt_curr31; dvleamt_curr[31])
                {
                }
                column(dvleamt_curr32; dvleamt_curr[32])
                {
                }
                column(dvleamt_curr33; dvleamt_curr[33])
                {
                }
                column(dvleamt_curr34; dvleamt_curr[34])
                {
                }
                column(dvleamt_curr35; dvleamt_curr[35])
                {
                }
                column(dvleamt_curr36; dvleamt_curr[36])
                {
                }
                column(dvleamt_curr37; dvleamt_curr[37])
                {
                }
                column(dvleamt_curr38; dvleamt_curr[38])
                {
                }
                column(dvleamt_curr39; dvleamt_curr[39])
                {
                }
                column(dvleamt_curr40; dvleamt_curr[40])
                {
                }
                column(dvleamt_curr41; dvleamt_curr[41])
                {
                }
                column(dvleamt_curr42; dvleamt_curr[42])
                {
                }
                column(dvleamt_curr43; dvleamt_curr[43])
                {
                }
                column(dvleamt_curr44; dvleamt_curr[44])
                {
                }
                column(dvleamt_curr45; dvleamt_curr[45])
                {
                }
                column(dvleamt_curr46; dvleamt_curr[46])
                {
                }
                column(dvleamt_curr47; dvleamt_curr[47])
                {
                }
                column(dvleamt_curr48; dvleamt_curr[48])
                {
                }
                column(dvleamt_curr49; dvleamt_curr[49])
                {
                }
                column(dvleamt_curr50; dvleamt_curr[50])
                {
                }
                column(dvleamt_curr51; dvleamt_curr[51])
                {
                }
                column(dvleamt_curr52; dvleamt_curr[52])
                {
                }
                column(dvleamt_curr53; dvleamt_curr[53])
                {
                }
                column(dvleamt_curr54; dvleamt_curr[54])
                {
                }
                column(dvleamt_curr55; dvleamt_curr[55])
                {
                }
                column(dvleamt_curr56; dvleamt_curr[56])
                {
                }
                column(dvleamt_curr57; dvleamt_curr[57])
                {
                }
                column(dvleamt_curr58; dvleamt_curr[58])
                {
                }
                column(dvleamt_curr59; dvleamt_curr[59])
                {
                }
                column(dvleamt_curr60; dvleamt_curr[60])
                {
                }
                column(dvleamt_curr61; dvleamt_curr[61])
                {
                }
                column(dvleamt_curr62; dvleamt_curr[62])
                {
                }
                column(dvleamt_curr63; dvleamt_curr[63])
                {
                }
                column(dvleamt_curr64; dvleamt_curr[64])
                {
                }
                column(dvleamt_curr65; dvleamt_curr[65])
                {
                }
                column(dvleamt_curr66; dvleamt_curr[66])
                {
                }
                column(dvleamt_curr67; dvleamt_curr[67])
                {
                }
                column(dvleamt_curr68; dvleamt_curr[68])
                {
                }
                column(dvleamt_curr69; dvleamt_curr[69])
                {
                }
                column(dvleamt_curr70; dvleamt_curr[70])
                {
                }
                column(invno2_1; invno2[1])
                {
                }
                column(invno2_2; invno2[2])
                {
                }
                column(invno2_3; invno2[3])
                {
                }
                column(invno2_4; invno2[4])
                {
                }
                column(invno2_5; invno2[5])
                {
                }
                column(invno2_6; invno2[6])
                {
                }
                column(invno2_7; invno2[7])
                {
                }
                column(invno2_8; invno2[8])
                {
                }
                column(invno2_9; invno2[9])
                {
                }
                column(invno2_10; invno2[10])
                {
                }
                column(invno2_11; invno2[11])
                {
                }
                column(invno2_12; invno2[12])
                {
                }
                column(invno2_13; invno2[13])
                {
                }
                column(invno2_14; invno2[14])
                {
                }
                column(invno2_15; invno2[15])
                {
                }
                column(invno2_16; invno2[16])
                {
                }
                column(invno2_17; invno2[17])
                {
                }
                column(invno2_18; invno2[18])
                {
                }
                column(invno2_19; invno2[19])
                {
                }
                column(invno2_20; invno2[20])
                {
                }
                column(invno2_21; invno2[21])
                {
                }
                column(invno2_22; invno2[22])
                {
                }
                column(invno2_23; invno2[23])
                {
                }
                column(invno2_24; invno2[24])
                {
                }
                column(invno2_25; invno2[25])
                {
                }
                column(invno2_26; invno2[26])
                {
                }
                column(invno2_27; invno2[27])
                {
                }
                column(invno2_28; invno2[28])
                {
                }
                column(invno2_29; invno2[29])
                {
                }
                column(invno2_30; invno2[30])
                {
                }
                column(invno2_31; invno2[31])
                {
                }
                column(invno2_32; invno2[32])
                {
                }
                column(invno2_33; invno2[33])
                {
                }
                column(invno2_34; invno2[34])
                {
                }
                column(invno2_35; invno2[35])
                {
                }
                column(invno2_36; invno2[36])
                {
                }
                column(invno2_37; invno2[37])
                {
                }
                column(invno2_38; invno2[38])
                {
                }
                column(invno2_39; invno2[39])
                {
                }
                column(invno2_40; invno2[40])
                {
                }
                column(invno2_41; invno2[41])
                {
                }
                column(invno2_42; invno2[42])
                {
                }
                column(invno2_43; invno2[43])
                {
                }
                column(invno2_44; invno2[44])
                {
                }
                column(invno2_45; invno2[45])
                {
                }
                column(invno2_46; invno2[46])
                {
                }
                column(invno2_47; invno2[47])
                {
                }
                column(invno2_48; invno2[48])
                {
                }
                column(invno2_49; invno2[49])
                {
                }
                column(invno2_50; invno2[50])
                {
                }
                column(invno2_51; invno2[51])
                {
                }
                column(invno2_52; invno2[52])
                {
                }
                column(invno2_53; invno2[53])
                {
                }
                column(invno2_54; invno2[54])
                {
                }
                column(invno2_55; invno2[55])
                {
                }
                column(invno2_56; invno2[56])
                {
                }
                column(invno2_57; invno2[57])
                {
                }
                column(invno2_58; invno2[58])
                {
                }
                column(invno2_59; invno2[59])
                {
                }
                column(invno2_60; invno2[60])
                {
                }
                column(usename; usename)
                {
                }
                column(DebitLCY2; VendDebitAmtLCY)
                {
                }
                column(CredLCY2; VendCreditAmtLCY)
                {
                }
                column(DebitCurr2; VendDebitAmt)
                {
                }
                column(CreditCurr2; Abs(VendCreditAmt))
                {
                }
                dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Vendor Ledger Entry No." = field("Entry No.");
                    DataItemTableView = sorting("Vendor Ledger Entry No.", "Entry Type", "Posting Date") where("Entry Type" = const("Correction of Remaining Amount"));
                    column(EntryTyp_DetVendLedgEntry; "Detailed Vendor Ledg. Entry"."Entry Type")
                    {
                    }
                    column(Correction; Correction)
                    {
                        AutoFormatType = 1;
                    }
                    column(VendBalLCY22; VendBalanceLCY)
                    {
                    }
                    trigger OnPreDataItem();
                    begin
                        SetFilter("Posting Date", VendDateFilter);
                    end;

                    trigger OnAfterGetRecord();
                    begin
                        Correction := Correction + "Amount (LCY)";
                        VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    end;

                    trigger OnPostDataItem();
                    begin
                        SumCorrections := SumCorrections + Correction;
                    end;

                }
                dataitem("Detailed Vendor Ledg. Entry2"; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Vendor Ledger Entry No." = field("Entry No.");
                    DataItemTableView = sorting("Vendor Ledger Entry No.", "Entry Type", "Posting Date") where("Entry Type" = const("Appln. Rounding"));
                    column(Entry_DetVendLedgEntry2; "Detailed Vendor Ledg. Entry2"."Entry Type")
                    {
                    }
                    column(VendBalanceLCY3; VendBalanceLCY)
                    {
                        AutoFormatType = 1;
                    }
                    column(ApplicationRounding; ApplicationRounding)
                    {
                        AutoFormatType = 1;
                    }
                    trigger OnPreDataItem();
                    begin
                        SetFilter("Posting Date", VendDateFilter);
                    end;

                    trigger OnAfterGetRecord();
                    begin
                        ApplicationRounding := ApplicationRounding + "Amount (LCY)";
                        VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    end;

                }
                trigger OnPreDataItem();
                begin
                    VendLedgEntryExists := false;

                end;

                trigger OnAfterGetRecord();
                begin
                    CalcFields(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");
                    sno += 1;
                    VendLedgEntryExists := true;
                    if PrintAmountsInLCY then begin
                        VendAmount := "Amount (LCY)";
                        VendRemainAmount := "Remaining Amt. (LCY)";
                        VendCurrencyCode := '';
                    end else begin
                        VendAmount := Amount;
                        VendRemainAmount := "Remaining Amount";
                        VendCurrencyCode := "Currency Code";
                    end;
                    VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    if ("Document Type" = "document type"::Payment) or ("Document Type" = "document type"::Refund) then
                        VendEntryDueDate := 0D
                    else
                        VendEntryDueDate := "Due Date";
                    SourceCode.SetRange(SourceCode.Code, "Source Code");
                    if SourceCode.Find('-') then
                        Desc2 := SourceCode.Description;
                    TDSAmt := 0;
                    TDSAmt1 := 0;
                    TDSEntry.SetRange(TDSEntry."Document No.", "Document No.");
                    if TDSEntry.FindFirst then
                        repeat
                            TDSAmt += TDSEntry."Bal. TDS Including SHE CESS" + TDSAmt;
                            if "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."document type"::Invoice then
                                TDSAmt1 += TDSEntry."Bal. TDS Including SHE CESS";
                        until TDSEntry.Next = 0;
                    //6130::06/08/14
                    if ("Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."document type"::Payment)
                    and ("Vendor Ledger Entry"."Purchase Order No." = '') then begin
                        TDSAmt := 0;
                    end;
                    TDS_Total += TDSAmt;
                    Clear(VoucherText);
                    i := 0;
                    Rec_PostedN.Reset;
                    Rec_PostedN.SetRange(Rec_PostedN."Document No.", "Document No.");
                    if Rec_PostedN.FindFirst then
                        repeat
                            i += 1;
                            VoucherText[i] := Rec_PostedN.Narration;
                        until Rec_PostedN.Next = 0;
                    Clear(CommentText);
                    j := 0;
                    Rec_PurchCommentLine.Reset;
                    Rec_PurchCommentLine.SetRange(Rec_PurchCommentLine."No.", "Document No.");
                    if Rec_PurchCommentLine.FindFirst then
                        repeat
                            j += 1;
                            CommentText[j] := Rec_PurchCommentLine.Comment;
                        until Rec_PurchCommentLine.Next = 0;
                    Clear(DimText);
                    DimSetEntry.Reset;
                    DimSetEntry.SetRange("Dimension Set ID", "Dimension Set ID");
                    if DimSetEntry.FindSet(false, false) then begin
                        repeat
                            DimSetEntry.CalcFields(DimSetEntry."Dimension Value Name");
                            if DimText = '' then
                                DimText := DimSetEntry."Dimension Code" + ':' + DimSetEntry."Dimension Value Name"
                            else
                                DimText := DimText + ', ' + DimSetEntry."Dimension Code" + ':' + DimSetEntry."Dimension Value Name";
                        until DimSetEntry.Next = 0;
                    end;
                    //6130::06/08/14
                    /*
					VLE.RESET;
					VLE.SETRANGE("Document No.","Document No.");
					IF VLE.FINDSET(FALSE,FALSE) THEN
					REPEAT
					AppliedVendLedgr.RESET;
					AppliedVendLedgr.SETFILTER("Entry Type",'%1',AppliedVendLedgr."Entry Type"::Application);
					AppliedVendLedgr.SETFILTER(Unapplied,'%1',FALSE);
					AppliedVendLedgr.SETRANGE("Applied Vend. Ledger Entry No.",VLE."Entry No.");
					IF AppliedVendLedgr.FINDSET THEN
					REPEAT
					  AppliedVendLedgr."Apply Entry":=TRUE;
					  AppliedVendLedgr."Applied Doc No":=VLE."Document No.";
					  AppliedVendLedgr.MODIFY(TRUE);
					UNTIL AppliedVendLedgr.NEXT=0;
					UNTIL VLE.NEXT=0;
					VLE.RESET;
					VLE.SETRANGE("Document No.","Document No.");
					IF VLE.FINDSET(FALSE,FALSE) THEN
					REPEAT
					AppliedVendLedgr1.RESET;
					AppliedVendLedgr1.SETFILTER("Entry Type",'%1',AppliedVendLedgr1."Entry Type"::Application);
					AppliedVendLedgr1.SETFILTER(Unapplied,'%1',FALSE);
					AppliedVendLedgr1.SETRANGE("Vendor Ledger Entry No.",VLE."Entry No.");
					IF AppliedVendLedgr1.FINDSET THEN
					REPEAT
					  AppliedVendLedgr1."Apply Entry":=TRUE;
					  AppliedVendLedgr1."Applied Doc No":=VLE."Document No.";
					  AppliedVendLedgr1.MODIFY(TRUE);
					UNTIL AppliedVendLedgr1.NEXT=0;
					UNTIL  VLE.NEXT=0;
					k:=0;
					m:=0;
					n:=0;
					v:=0;
					CLEAR(ExternalDocNo);
					CLEAR(dvleamt);
					CLEAR(dvleamt_curr);
					CLEAR(invno2);
					VLE.RESET;
					VLE.SETRANGE("Document No.","Document No.");
					IF VLE.FINDSET(FALSE,FALSE) THEN
					VLE1.RESET;
					VLE1.SETRANGE("Applied Doc No",VLE."Document No.");
					VLE1.SETFILTER("Entry Type",'%1',VLE1."Entry Type"::Application);
					VLE1.SETFILTER(VLE1.Unapplied,'%1',FALSE);
					VLE1.SETRANGE("Apply Entry",TRUE);
					IF VLE1.FINDSET(FALSE,FALSE) THEN
					REPEAT
					IF VLE1."Vendor Ledger Entry No." <> VLE1."Applied Vend. Ledger Entry No." THEN BEGIN
					k+=1;
					m+=1;
					n+=1;
					v+=1;
					dvleamt[m]:=ABS(VLE1."Amount (LCY)");
					dvleamt_curr[k]:=ABS(VLE1.Amount);
					PurchaseDocNo:='';
					invno:='';
					VLE2.RESET;
					VLE2.SETRANGE("Entry No.",VLE1."Applied Vend. Ledger Entry No.");
					IF VLE2.FINDFIRST THEN
					  PurchaseDocNo:=VLE2."Document No.";
					  invno:=VLE2."External Document No.";
					IF PurchaseDocNo = "Document No." THEN BEGIN
					  PurchaseDocNo:='';
					  invno:='';
					  VLE2.RESET;
					  VLE2.SETRANGE("Entry No.",VLE1."Vendor Ledger Entry No.");
					  IF VLE2.FINDFIRST THEN
					  PurchaseDocNo:=VLE2."Document No.";
					  invno:=VLE2."External Document No.";
					  END;
					   ExternalDocNo[n]:=PurchaseDocNo;
					   invno2[v]:=invno;
					END;
					UNTIL VLE1.NEXT=0;
					*/
                    Clear(usename);
                    Rec_UserSetup.Reset;
                    if Rec_UserSetup.Get(UserId) then
                        Rec_UserSetup.CalcFields(Rec_UserSetup."User Name");
                    usename := Rec_UserSetup."User Name";
                    VendDebitAmtLCY += "Debit Amount (LCY)";
                    VendCreditAmtLCY += "Credit Amount (LCY)";
                    //MESSAGE('%1|%2',VendCreditAmtLCY,"Credit Amount (LCY)");
                    if "Vendor Ledger Entry".Amount > 0 then
                        VendDebitAmt += Amount
                    else
                        VendCreditAmt += Amount;
                    //MESSAGE('%1',VendDebitAmt);

                end;

            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(VendBalanceLCY4; VendBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(StartBalAdjLCY1; StartBalAdjLCY)
                {
                }
                column(StartBalanceLCY1; StartBalanceLCY)
                {
                }
                column(VendBalStrtBalStrtBalAdj; VendBalanceLCY - StartBalanceLCY - StartBalAdjLCY)
                {
                    AutoFormatType = 1;
                }
                trigger OnAfterGetRecord();
                begin
                    /*
					IF NOT VendLedgEntryExists AND ((StartBalanceLCY = 0) OR ExcludeBalanceOnly) THEN BEGIN
					  StartBalanceLCY := 0;
					  CurrReport.SKIP;
					END;
					*/

                end;

            }
            trigger OnPreDataItem();
            begin
                PageGroupNo := 1;
                SumCorrections := 0;
                VendDebitAmtLCY := 0;
                VendCreditAmtLCY := 0;
                VendDebitAmt := 0;
                VendCreditAmt := 0;
                // ReportForNav.GetDataItem('Vendor').NewPagePerRecord := PrintOnlyOnePerPage;

            end;

            trigger OnAfterGetRecord();
            begin
                if PrintOnlyOnePerPage then
                    PageGroupNo := PageGroupNo + 1;
                sno := 0;
                StartBalanceLCY := 0;
                StartBalAdjLCY := 0;
                if VendDateFilter <> '' then begin
                    if GetRangeMin("Date Filter") <> 0D then begin
                        SetRange("Date Filter", 0D, GetRangeMin("Date Filter") - 1);
                        CalcFields("Net Change (LCY)");
                        StartBalanceLCY := -"Net Change (LCY)";
                    end;
                    SetFilter("Date Filter", VendDateFilter);
                    SetFilter("Global Dimension 1 Filter", BranchFilter);//6130
                    CalcFields("Net Change (LCY)");
                    StartBalAdjLCY := -"Net Change (LCY)";
                    VendorLedgerEntry.SetCurrentkey("Vendor No.", "Posting Date");
                    VendorLedgerEntry.SetRange("Vendor No.", "No.");
                    VendorLedgerEntry.SetFilter("Posting Date", VendDateFilter);
                    VendorLedgerEntry.SetFilter("Global Dimension 1 Code", BranchFilter);
                    if VendorLedgerEntry.Find('-') then
                        repeat
                            VendorLedgerEntry.SetFilter("Date Filter", VendDateFilter);
                            VendorLedgerEntry.CalcFields("Amount (LCY)");
                            StartBalAdjLCY := StartBalAdjLCY - VendorLedgerEntry."Amount (LCY)";
                            "Detailed Vendor Ledg. Entry".SetCurrentkey("Vendor Ledger Entry No.", "Entry Type", "Posting Date");
                            "Detailed Vendor Ledg. Entry".SetRange("Vendor Ledger Entry No.", VendorLedgerEntry."Entry No.");
                            "Detailed Vendor Ledg. Entry".SetFilter("Entry Type", '%1|%2',
                              "Detailed Vendor Ledg. Entry"."entry type"::"Correction of Remaining Amount",
                              "Detailed Vendor Ledg. Entry"."entry type"::"Appln. Rounding");
                            "Detailed Vendor Ledg. Entry".SetFilter("Posting Date", VendDateFilter);
                            if "Detailed Vendor Ledg. Entry".Find('-') then
                                repeat
                                    StartBalAdjLCY := StartBalAdjLCY - "Detailed Vendor Ledg. Entry"."Amount (LCY)";
                                until "Detailed Vendor Ledg. Entry".Next = 0;
                            "Detailed Vendor Ledg. Entry".Reset;
                        until VendorLedgerEntry.Next = 0;
                end;
                if GetRangeMin("Date Filter") <> 0D then
                    txtOpnHeading := 'Opening Balance as on ' + Format(GetRangeMin("Date Filter") - 1)
                else
                    txtOpnHeading := 'Opening Balance';
                // ReportForNav.GetDataItem('Vendor').PrintOnlyIfDetail := ExcludeBalanceOnly or (StartBalanceLCY = 0);
                VendBalanceLCY := StartBalanceLCY + StartBalAdjLCY;
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
                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Amounts in LCY';
                        Visible = false;
                    }
                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Page per Vendor';
                        Visible = false;
                    }
                    field(ExcludeBalanceOnly; ExcludeBalanceOnly)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Exclude Vendors That Have A Balance Only';
                        MultiLine = true;
                        Visible = false;
                    }
                    field("Print Dimension"; PrintDimension)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Print Narration"; PrintNarration)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Print Currency"; PrintCurrency)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Only Foreign Currency"; ShowCurrency)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Show Applied Entry"; appliedentry)
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                    }
                    field("Location Code"; LocCode)
                    {
                        ApplicationArea = Basic;
                        TableRelation = Location.Code;
                    }

                }
            }
        }

        actions
        {
        }
    }



    trigger OnPreReport()
    begin
        Rec_CompInfor.Get;
        if LocRec.Get(LocCode) then begin
            if Rec_State.Get(LocRec."State Code") then;
            if Rec_Country.Get(LocRec."Country/Region Code") then;
            CompName := LocRec.Name + ' ' + LocRec."Name 2";
            CompAdd := LocRec.Address + ', ' + LocRec."Address 2" + ', ' + LocRec.City + '-' + LocRec."Post Code" + ',' + Rec_State.Description + ',' + Rec_Country.Name;
        end else begin
            //YS Report if Rec_State.Get(Rec_CompInfor.State) then;
            if Rec_Country.Get(Rec_CompInfor."Country/Region Code") then;
            CompName := Rec_CompInfor.Name + '' + Rec_CompInfor."Name 2";
            CompAdd := Rec_CompInfor.Address + ',' + Rec_CompInfor.City + '-' + Rec_CompInfor."Post Code" + ',' + Rec_State.Description + ',' + Rec_Country.Name;
        end;
        VendFilter := Vendor.GetFilters;
        VendDateFilter := Vendor.GetFilter("Date Filter");
        BranchFilter := Vendor.GetFilter("Global Dimension 1 Filter");
        if PrintAmountsInLCY then begin
            AmountCaption := "Vendor Ledger Entry".FieldCaption("Amount (LCY)");
            RemainingAmtCaption := "Vendor Ledger Entry".FieldCaption("Remaining Amt. (LCY)");
        end else begin
            AmountCaption := "Vendor Ledger Entry".FieldCaption(Amount);
            RemainingAmtCaption := "Vendor Ledger Entry".FieldCaption("Remaining Amount");
        end;
        // ;ReportsForNavPre;
        Clear(TDS_Total);
    end;

    var
        Text000: label 'Period: %1';
        Rec_CompInfor: Record "Company Information";
        Rec_State: Record State;
        Rec_Country: Record "Country/Region";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        VendFilter: Text;
        VendDateFilter: Text[30];
        VendAmount: Decimal;
        VendRemainAmount: Decimal;
        VendBalanceLCY: Decimal;
        VendEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        Correction: Decimal;
        ApplicationRounding: Decimal;
        ExcludeBalanceOnly: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        VendLedgEntryExists: Boolean;
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        VendCurrencyCode: Code[10];
        PageGroupNo: Integer;
        SumCorrections: Decimal;
        TDS_Total: Decimal;
        VendDetailTrialBalCapLbl: label 'Vendor Ledger';
        PageCaptionLbl: label 'Page';
        AllamountsareinLCYCaptionLbl: label 'All amounts are in LCY';
        ReportIncludesvendorshavebalanceCaptionLbl: label 'This report also includes vendors that only have balances.';
        PostingDateCaptionLbl: label 'Posting Date';
        BalanceLCYCaptionLbl: label 'Balance (LCY)';
        DueDateCaptionLbl: label 'Due Date';
        AdjofOpeningBalanceCaptionLbl: label 'Adj. of Opening Balance';
        TotalLCYCaptionLbl: label 'Total (LCY)';
        TotalAdjofOpenBalCaptionLbl: label 'Total Adj. of Opening Balance';
        TotalLCYBeforePeriodCaptionLbl: label 'Total (LCY) Before Period';
        i: Integer;
        Rec_PostedN: Record "Posted Narration";
        VoucherText: array[100] of Text[250];
        j: Integer;
        Rec_PurchCommentLine: Record "Purch. Comment Line";
        CommentText: array[70] of Text[1024];
        DimText: Text;
        DimSetEntry: Record "Dimension Set Entry";
        ShowCurrency: Boolean;
        SourceCode: Record "Source Code";
        Desc2: Text[50];
        sno: Integer;
        TDSEntry: Record "TDS Entry";
        TDSAmt: Decimal;
        TDSAmt1: Decimal;
        PrintNarration: Boolean;
        PrintDimension: Boolean;
        PrintCurrency: Boolean;
        VLE: Record "Vendor Ledger Entry";
        VLE1: Record "Detailed Vendor Ledg. Entry";
        VLE2: Record "Vendor Ledger Entry";
        AppliedVendLedgr: Record "Detailed Vendor Ledg. Entry";
        AppliedVendLedgr1: Record "Detailed Vendor Ledg. Entry";
        PurchaseDocNo: Text[50];
        ExternalDocNo: array[100] of Code[20];
        m: Integer;
        n: Integer;
        k: Integer;
        v: Integer;
        dvleamt: array[100] of Decimal;
        dvleamt_curr: array[100] of Decimal;
        appliedentry: Boolean;
        invno: Text[50];
        invno2: array[80] of Text[50];
        VendDebitAmtLCY: Decimal;
        VendCreditAmtLCY: Decimal;
        VendDebitAmt: Decimal;
        VendCreditAmt: Decimal;
        txtOpnHeading: Text[50];
        Rec_UserSetup: Record "User Setup";
        usename: Text[50];
        ResponsibilityCenter: Record "Responsibility Center";
        LocCode: Code[20];
        LocRec: Record Location;
        CompName: Text;
        CompAdd: Text;
        BranchFilter: Code[20];

    /// <summary>
    /// InitializeRequest.
    /// </summary>
    /// <param name="NewPrintAmountsInLCY">Boolean.</param>
    /// <param name="NewPrintOnlyOnePerPage">Boolean.</param>
    /// <param name="NewExcludeBalanceOnly">Boolean.</param>
    procedure InitializeRequest(NewPrintAmountsInLCY: Boolean; NewPrintOnlyOnePerPage: Boolean; NewExcludeBalanceOnly: Boolean)
    begin
        PrintAmountsInLCY := NewPrintAmountsInLCY;
        PrintOnlyOnePerPage := NewPrintOnlyOnePerPage;
        ExcludeBalanceOnly := NewExcludeBalanceOnly;
    end;


}

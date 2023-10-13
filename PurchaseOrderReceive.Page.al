/// <summary>
/// Page Purchase Order Receive (ID 50001).
/// </summary>
Page 50001 "Purchase Order Receive"
{
    Caption = 'Purchase Order Receive';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Invoice,Request Approval';
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Order),
                            Subcontracting = filter(false),
                            Status = filter(Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnValidate()
                    begin
                        BuyfromVendorNoOnAfterValidate;
                    end;
                }
                field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Receiving No. Series"; Rec."Receiving No. Series")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Last GRN No Used"; Rec."Last GRN No Used")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quote No."; Rec."Quote No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Vendor Order No."; Rec."Vendor Order No.")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bill No."; Rec."Bill No.")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Vendor GST Reg. No."; Rec."Vendor GST Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Date"; Rec."Bill Date")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;

                    trigger OnValidate()
                    begin
                        PurchaserCodeOnAfterValidate;
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Gate Entry No."; Rec."Gate Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Gate Entry Posting Date"; Rec."Gate Entry Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Challan No."; Rec."Challan No.")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Challan Date"; Rec."Challan Date")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("LR/RR No."; Rec."LR/RR No.")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("LR/RR Date"; Rec."LR/RR Date")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Vehicle No."; Rec."Vehicle No1.")
                {
                    ApplicationArea = Basic;
                    Style = Unfavorable;
                    StyleExpr = true;
                }
                field("Statistics Checked"; Rec."Statistics Checked")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(PurchLines; "Purchase Order Rec. Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        PaytoVendorNoOnAfterValidate;
                    end;
                }
                field("Pay-to Contact No."; Rec."Pay-to Contact No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay-to Address"; Rec."Pay-to Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Pay-to Address 2"; Rec."Pay-to Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Pay-to Post Code"; Rec."Pay-to Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Receiving No."; Rec."Receiving No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to City"; Rec."Pay-to City")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay-to Contact"; Rec."Pay-to Contact")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    ApplicationArea = Basic;
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = Basic;
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Inbound Whse. Handling Time"; Rec."Inbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entry Point"; Rec."Entry Point")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Area"; Rec.Area)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group(Prepayment)
            {
                Caption = 'Prepayment';
                Visible = false;
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field("Compress Prepayment"; Rec."Compress Prepayment")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Payment Terms Code"; Rec."Prepmt. Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Due Date"; Rec."Prepayment Due Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Prepmt. Payment Discount %"; Rec."Prepmt. Payment Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Pmt. Discount Date"; Rec."Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Application)
            {
                Caption = 'Application';
                Visible = false;
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Tax Information")
            {
                Caption = 'Tax Information';
                Visible = false;
                // field("Service Type (Rev. Chrg.)"; "Service Type (Rev. Chrg.)")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Consignment Note No."; "Consignment Note No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Declaration Form (GTA)"; "Declaration Form (GTA)")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Input Service Distribution"; "Input Service Distribution")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Transit Document"; "Transit Document")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Trading; Rec.Trading)
                {
                    ApplicationArea = Basic;
                }
                // field("C Form"; "C Form")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Form Code"; "Form Code")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Promoted;
                // }
                // field("Form No."; "Form No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("LC No."; "LC No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Service Tax Rounding Precision"; "Service Tax Rounding Precision")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Service Tax Rounding Type"; "Service Tax Rounding Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(PoT; PoT)
                // {
                //     ApplicationArea = Basic;
                // }
                group("Manufacturer Detail")
                {
                    Caption = 'Manufacturer Detail';
                    // field("Manufacturer E.C.C. No."; "Manufacturer E.C.C. No.")
                    // {
                    //     ApplicationArea = Basic;
                    // }
                    // field("Manufacturer Name"; "Manufacturer Name")
                    // {
                    //     ApplicationArea = Basic;
                    // }
                    // field("Manufacturer Address"; "Manufacturer Address")
                    // {
                    //     ApplicationArea = Basic;
                    // }
                }
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = field("Pay-to Vendor No.");
                Visible = false;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        Rec.OpenPurchaseOrderStatistics;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                        //TCPL::6130::30/08/16
                        Rec."Statistics Checked" := true;
                        CurrPage.Update;
                        //TCPL::6130::30/08/16
                    end;
                }
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    Promoted = false;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
#pragma warning disable AL0432
#pragma warning disable AL0603
                        ApprovalEntries.Setfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
#pragma warning restore AL0603
#pragma warning restore AL0432
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Receipts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipts';
                    Image = PostedReceipts;
                    RunObject = Page "Posted Purchase Receipts";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                }
                action(Invoices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoices';
                    Image = Invoice;
                    Promoted = false;
                    RunObject = Page "Posted Purchase Invoices";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                }
                action(PostedPrepaymentInvoices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page "Posted Purchase Invoices";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                }
                action(PostedPrepaymentCrMemos)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page "Posted Purchase Credit Memos";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                separator(Action1170000071)
                {
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = Page "Warehouse Activity List";
                    RunPageLink = "Source Document" = const("Purchase Order"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Document", "Source No.", "Location Code");
                }
                action("Whse. Receipt Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Whse. Receipt Lines';
                    Image = ReceiptLines;
                    RunObject = Page "Whse. Receipt Lines";
                    RunPageLink = "Source Type" = const(39),
#pragma warning disable AL0603
                                  "Source Subtype" = field("Document Type"),
#pragma warning restore AL0603
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                }
                separator(Action1170000068)
                {
                }
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action(Warehouse_GetSalesOrder)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        RunObject = Codeunit "Purch.-Get Drop Shpt.";
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action("Get &Sales Order")
                    {
                        AccessByPermission = TableData "Sales Shipment Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";

                        trigger OnAction()
                        var
                            PurchHeader: Record "Purchase Header";
                            DistIntegration: Codeunit "Dist. Integration";
                        begin
                            PurchHeader.Copy(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    RunPageLink = "Table ID" = const(38),
                                  "Document Type" = field("Document Type"),
                                  "Document No." = field("No.");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
            group(ActionGroup1170000057)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action1170000056)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1170000053)
                {
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData "Vendor Invoice Disc." = R;
                    ApplicationArea = Basic;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Action1170000050)
                {
                }
                action("Get St&d. Vend. Purchase Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    Image = VendorCode;

                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(Action1170000048)
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }
                action(MoveNegativeLines)
                {
                    ApplicationArea = Basic;
                    Caption = 'Move Negative Lines';
                    Ellipsis = true;
                    Image = MoveNegativeLines;

                    trigger OnAction()
                    begin
                        Clear(MoveNegPurchLines);
                        MoveNegPurchLines.SetPurchHeader(Rec);
                        MoveNegPurchLines.RunModal;
                        MoveNegPurchLines.ShowDocument;
                    end;
                }
                group(ActionGroup1170000045)
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action(Functions_GetSalesOrder)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        RunObject = Codeunit "Purch.-Get Drop Shpt.";
                    }
                }
                group(ActionGroup1170000043)
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action1170000042)
                    {
                        AccessByPermission = TableData "Sales Shipment Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";

                        trigger OnAction()
                        var
                            DistIntegration: Codeunit "Dist. Integration";
                            PurchHeader: Record "Purchase Header";
                        begin
                            PurchHeader.Copy(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
                // separator(Action1170000041)
                // {
                // }
                // action("St&ructure")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'St&ructure';
                //     Image = Hierarchy;
                //     RunObject = Page "Structure Order Details";
                //     RunPageLink = Type = const(Purchase),
                //                   "Document Type" = field("Document Type"),
                //                   "Document No." = field("No.");
                // }
                // action("Transit Documents")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Transit Documents';
                //     Image = TransferOrder;
                //     RunObject = Page "Transit Document Order Details";
                //     RunPageLink = Type = const(Purchase),
                //                   "PO / SO No." = field("No."),
                //                   "Vendor / Customer Ref." = field("Buy-from Vendor No."),
                //                   State = field(State);
                // }
                // action("Deferment Schedule")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Deferment Schedule';
                //     Image = Installments;
                //     RunObject = Page "Deferment Schedule";
                //     RunPageLink = "Document No." = field("No.");
                // }
                action("Get Gate Entry Lines")
                {
                    ApplicationArea = Basic, Suite;
                    Image = GetLines;
                    ToolTip = 'View available gate entry lines for attachment.';
                    trigger OnAction()
                    var
                        GateEntryHandler: Codeunit "Gate Entry Handler";
                    begin
                        GateEntryHandler.GetPurchaseGateEntryLines(Rec);
                    end;
                }
                action("Attached Gate Entry")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attached Gate Entry';
                    Image = InwardEntry;
                    RunObject = Page "Gate Entry Attachment List";
                    RunPageLink = "Source No." = field("No."),
                                  "Source Type" = const("Purchase Order"),
                                  "Entry Type" = const(Inward);
                }
                // action("Detailed &Tax")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Detailed &Tax';
                //     Image = TaxDetail;
                //     RunObject = Page "Purch. Detailed Tax";
                //     RunPageLink = "Document Type" = field("Document Type"),
                //                   "Document No." = field("No."),
                //                   "Transaction Type" = const(Purchase);
                // }
                action("Archive Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Archi&ve Document';
                    Image = Archive;

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Send IC Purchase Order")
                {
                    AccessByPermission = TableData "IC G/L Account" = R;
                    ApplicationArea = Basic;
                    Caption = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;

                    trigger OnAction()
                    var
                        ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                            ICInOutboxMgt.SendPurchDoc(Rec, false);
                    end;
                }
                separator(Action1170000033)
                {
                }
                // action("Calc&ulate Structure Values")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Calc&ulate Structure Values';
                //     Image = CalculateHierarchy;

                //     trigger OnAction()
                //     begin
                //         // PurchLine.CalculateStructures(Rec);
                //         // PurchLine.AdjustStructureAmounts(Rec);
                //         // PurchLine.UpdatePurchLines(Rec);
                //     end;
                // }
                // action("Calculate TDS")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Calculate TDS';
                //     Image = Calculate;

                //     trigger OnAction()
                //     begin
                //         PurchLine.CalculateTDS(Rec);
                //     end;
                // }
                // separator(Action1170000030)
                // {
                // }
                group(IncomingDocument)
                {
                    Caption = 'Incoming Document';
                    Image = Documents;
                    action(IncomingDocCard)
                    {
                        ApplicationArea = Basic;
                        Caption = 'View Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            IncomingDocument.ShowCardFromEntryNo(Rec."Incoming Document Entry No.");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData "Incoming Document" = R;
                        ApplicationArea = Basic;
                        Caption = 'Select Incoming Document';
                        Image = SelectLineToApply;

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            Rec.Validate("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(Rec."Incoming Document Entry No.", Rec.RecordId));
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Incoming Document from File';
                        Ellipsis = true;
                        Enabled = not HasIncomingDocument;
                        Image = Attach;
                        //The property 'ToolTip' cannot be empty.
                        //ToolTip = '';

                        trigger OnAction()
                        var
                            IncomingDocumentAttachment: Record "Incoming Document Attachment";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPurchaseDocument(Rec);
                        end;
                    }
                    action(RemoveIncomingDoc)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Remove Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = RemoveLine;
                        //The property 'ToolTip' cannot be empty.
                        //ToolTip = '';

                        trigger OnAction()
                        begin
                            Rec."Incoming Document Entry No." := 0;
                        end;
                    }
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.IsPurchaseApprovalsWorkflowEnabled(Rec) then
                            //YS Page if ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) then
                            ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            group(ActionGroup1170000021)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("Create &Whse. Receipt")
                {
                    AccessByPermission = TableData "Warehouse Receipt Header" = R;
                    ApplicationArea = Basic;
                    Caption = 'Create &Whse. Receipt';
                    Image = NewReceipt;

                    trigger OnAction()
                    var
                        GetSourceDocInbound: Codeunit "Get Source Doc. Inbound";
                    begin
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        if not Rec.Find('=><') then
                            Rec.Init;
                    end;
                }
                action("Create Inventor&y Put-away/Pick")
                {
                    AccessByPermission = TableData "Posted Invt. Put-away Header" = R;
                    ApplicationArea = Basic;
                    Caption = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.CreateInvtPutAwayPick;

                        if not Rec.Find('=><') then
                            Rec.Init;
                    end;
                }
                // action("Get Gate Entry Lines")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Get Gate Entry Lines';
                //     Image = GetLines;

                //     trigger OnAction()
                //     begin
                //         //YS Page   GetGateEntryLines;
                //     end;
                // }
                separator(Action1170000017)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;

                action(Post1)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    var
                        LrecPurchaseLine: Record "Purchase Line";
                        LrecItem: Record Item;
                        recPurchaseLine: Record "Purchase Line";
                        PurLineRec: Record "Purchase Line";
                        ItemRec: Record Item;
                        GateEntryAttachRec: Record "Gate Entry Attachment";
                    begin
                        //PBTPL-Amit-InwardGate Entry +
                        if (CompanyName = 'The Malt Company (India) Pvt. Limited') then begin
                            PurLineRec.Reset;
                            PurLineRec.SetRange("Document No.", Rec."No.");
                            PurLineRec.SetRange(Type, PurLineRec.Type::Item);
                            PurLineRec.SetRange("Location Code", 'GOD-DABODA');
                            if PurchLine.FindFirst() then begin
                                GateEntryAttachRec.Reset();
                                GateEntryAttachRec.SetRange("Entry Type", GateEntryAttachRec."Entry Type"::Inward);
                                GateEntryAttachRec.SetRange("Source Type", GateEntryAttachRec."Source Type"::"Purchase Order");
                                GateEntryAttachRec.SetRange("Source No.", Rec."No.");
                                if not GateEntryAttachRec.FindFirst() then
                                    Error('Please attach Gate Entry Before post this Document.');
                            end;
                        end;
                        //PBTPL-Amit-InwardGate Entry -

                        // BIS
                        if (Rec."Bill No." = '') and (Rec."Challan No." = '') then
                            Error('Please fill either Bill No. or Challan No.');
                        if (Rec."Bill Date" = 0D) and (Rec."Challan Date" = 0D) then
                            Error('Please fill either Bill Date or Challan Date');

                        Rec.TestField("LR/RR No.");
                        Rec.TestField("LR/RR Date");
                        Rec.TestField("Vehicle No1.");
                        // TESTFIELD("Stack No.");

                        //-->AK 20200507
                        if Rec."Posting Date" < Rec."Order Date" then
                            Error('Posting Date should be greater than Order Date');
                        //<--AK 20200507

                        LrecPurchaseLine.Reset;
                        LrecPurchaseLine.SetRange("Document Type", LrecPurchaseLine."document type"::Order);
                        LrecPurchaseLine.SetRange("Document No.", Rec."No.");
                        LrecPurchaseLine.SetRange(Type, LrecPurchaseLine.Type::Item);
                        LrecPurchaseLine.SetFilter("No.", '<>%1', '');
                        LrecPurchaseLine.SetFilter("Qty. to Receive", '<>%1', 0);
                        if LrecPurchaseLine.FindFirst then begin   //RM
                            LrecItem.Get(LrecPurchaseLine."No.");
                            //  IF LrecItem."Quality Required" = TRUE THEN BEGIN   //TCPL::6130::02/09/16

                            //  IF (LrecItem."Item Category Code" = 'RM') AND (LrecPurchaseLine."Order Quantity"<>LrecPurchaseLine."Quantity Received") THEN REPEAT  //TCPL::6130::02/09/16
                            if (LrecItem."Item Category Code" = 'RM') and (LrecPurchaseLine."Packing Type" <> '') then begin   //CS-ASK
                                LrecPurchaseLine.TestField("Packing Type");
                                LrecPurchaseLine.TestField("No. of Bags");
                                LrecPurchaseLine.TestField("Gross Weight");
                                LrecPurchaseLine.TestField("Tare Weight");
                                LrecPurchaseLine.TestField("Qty to Accept");
                            end;
                            //UNTIL LrecPurchaseLine.NEXT=0;
                        end;
                        // BIS

                        //CS-ASK
                        recPurchaseLine.Reset;
                        recPurchaseLine.SetRange("Document No.", Rec."No.");
                        recPurchaseLine.SetFilter("Item Category Code", '%1', 'RM');
                        recPurchaseLine.SetFilter("Packing Type", '<>%1', '');
                        if recPurchaseLine.FindFirst then begin
                            if recPurchaseLine."Packing Line Created" = false then
                                Error('Please create packing details');
                        end;

                        //--> Ak
                        PurLineRec.Reset;
                        PurLineRec.SetRange("Document No.", Rec."No.");
                        PurLineRec.SetRange(Type, PurLineRec.Type::Item);
                        if PurLineRec.FindSet then
                            repeat
                                if ItemRec.Get(PurLineRec."No.") then begin
                                    if ItemRec."Inventory Posting Group" = 'RM JW' then
                                        //IF PurLineRec."Inward RM Price" = '' THEN
                                        //ERROR('Inword RM Price must have a value');
                                        PurLineRec.TestField("Inward RM Price");
                                end;
                            until PurLineRec.Next = 0;
                        //<-- Ak

                        Rec.challanexists; //TCPL::6130::25/08/16
                        // PostDocument(CODEUNIT::"Purch.-Post (Yes/No)", "Navigate After Posting"::"Posted Document");

                        Post(Codeunit::"Purch.-Post (Yes/No)");


                        recPurchaseLine.Reset;
                        recPurchaseLine.SetRange("Document Type", LrecPurchaseLine."Document Type");
                        recPurchaseLine.SetRange("Document No.", LrecPurchaseLine."Document No.");
                        if recPurchaseLine.FindSet then
                            repeat
                                recPurchaseLine."Qty to Accept" := 0;
                                recPurchaseLine."Gross Weight" := 0;
                                recPurchaseLine."Tare Weight" := 0;
                                recPurchaseLine."Packing Type" := '';
                                recPurchaseLine."No. of Bags" := 0;
                                recPurchaseLine."Weight of Empty Bags" := 0;
                                recPurchaseLine."Packing Line Created" := false;
                                recPurchaseLine.Modify;
                            until recPurchaseLine.Next = 0;

                    end;
                }
                action(Preview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Preview Posting';
                    Image = ViewPostedOrder;

                    trigger OnAction()
                    var
                        PurchPostYesNo: Codeunit "Purch.-Post (Yes/No)";
                    begin
                        PurchPostYesNo.Preview(Rec);
                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        Post(Codeunit::"Purch.-Post + Print");
                    end;
                }
                action("Test Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;

                    trigger OnAction()
                    begin
                        Report.RunModal(Report::"Batch Post Purchase Orders", true, true, Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Print Deferment Schedule")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Deferment Schedule';
                    Image = PrintInstallments;

                    trigger OnAction()
                    begin
                        /*//YS Page  DefermentBuffer.Reset;
                          // DefermentBuffer.SetRange("Document No.", Rec."No.");
                          Report.RunModal(16543, true, true, DefermentBuffer);*/
                    end;
                }
                action("Remove From Job Queue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueVisible;

                    trigger OnAction()
                    begin
                        Rec.CancelBackgroundPosting;
                    end;
                }
                separator(Action1170000008)
                {
                }
                group("Prepa&yment")
                {
                    Caption = 'Prepa&yment';
                    Image = Prepayment;
                    action("Prepayment Test &Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Prepayment Test &Report';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;

                        trigger OnAction()
                        begin
                            ReportPrint.PrintPurchHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Prepayment &Invoice';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction()
                        var
                            ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                                PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec, false);
                        end;
                    }
                    action("Post and Print Prepmt. Invoic&e")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post and Print Prepmt. Invoic&e';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction()
                        var
                            ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                                PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec, true);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Prepayment &Credit Memo';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction()
                        var
                            ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                                PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec, false);
                        end;
                    }
                    action("Post and Print Prepmt. Cr. Mem&o")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post and Print Prepmt. Cr. Mem&o';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction()
                        var
                            ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                                PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec, true);
                        end;
                    }
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        PurchLine: Record "Purchase Line";
        //YS Page DefermentBuffer: Record "Deferment Buffer";
        [InDataSet]

        JobQueueVisible: Boolean;
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        VendorInvoiceNoMandatory: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.Update;
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(Doctype::Order, Rec."No.");
    end;

    local procedure SetExtDocNoMandatoryCondition()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        PurchasesPayablesSetup.Get;
        VendorInvoiceNoMandatory := PurchasesPayablesSetup."Ext. Doc. No. Mandatory"
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        HasIncomingDocument := Rec."Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}


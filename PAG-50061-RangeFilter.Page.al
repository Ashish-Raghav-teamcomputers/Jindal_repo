// page 50074 "Range Filter"    //17141
page 50061 "Range Filter 2"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    SaveValues = true;
    SourceTable = 50021;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("From Days"; rec."From Days")
                {
                    ApplicationArea = All;
                }
                field("To Days"; Rec."To Days")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Sundry Debtors Aging")
            {
                Caption = 'Sundry Debtors Aging';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 50035;
                ApplicationArea = All;
            }
            action("Trade Creditors Aging")
            {
                Caption = 'Trade Creditors Aging';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report 50080;       //17141
                ApplicationArea = All;
            }
            action("Stock Aging ")
            {
                Caption = 'Stock Aging';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // RunObject = Report 50083;       //17141
                ApplicationArea = All;
            }
            action("Trade Creditors New")
            {
                ApplicationArea = All;
                // 15578   RunObject = Report 60013;
            }
        }
    }
}


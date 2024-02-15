report 50022 "Purchase Creation Export"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("Purchase Creation Header"; "Purchase Creation Header")
        {
            dataitem("Purchase Creation Line"; "Purchase Creation Line")
            {
                DataItemLink = "document no." = field("no.");
                DataItemLinkReference = "Purchase Creation Header";
                trigger OnAfterGetRecord()
                begin
                    MakeBody();
                end;
            }
        }

    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        MakeHeader();

    end;

    trigger OnPostReport()
    begin
        CreateExcelBook(); // Create Excel Book
    end;

    var
        myInt: Integer;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        StartDate: Date;
        EndDate: Date;
        CustomerNo: Code[250];

    local procedure MakeHeader()
    var
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Vendor No', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('External Doc. No.', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Document Type', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posting Date', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Segment Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Region Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Service Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Type', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('No.', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Unit Price', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('GST Group Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('HSN/SAC Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('TDS Section Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer Code', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn("Purchase Creation Header"."Vendor No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Header"."External Document No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Header"."Document Type", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Header"."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Header"."Global Dimension Code 1", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Header"."Global Dimension Code 2", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Header"."Dimension 4 Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);

        //Line
        TempExcelBuffer.AddColumn("Purchase Creation Line".Type, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line"."No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line".Qunatity, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line"."Direct Unit Cost", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line"."GST Group Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line"."HSN/SAC Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line"."TDS Section", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Purchase Creation Line"."Customer Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);


    end;


    Local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('PurchaseInvoice/Order');
        TempExcelBuffer.WriteSheet('PurchaseInvoice/Order', CompanyName, UserId);
        TempExcelBuffer.CloseBook();

        TempExcelBuffer.SetFriendlyFilename('PurchaseInvoice/Order');
        TempExcelBuffer.OpenExcel();
    end;

    var
        RecPurchHeader: Record "Purchase Creation Header";
        RecPurchLine: Record "Purchase Creation Line";
        NetAmount: Decimal;
        NetQty: Decimal;
        ReturnQty: Decimal;
        ReturnAmount: Decimal;
}
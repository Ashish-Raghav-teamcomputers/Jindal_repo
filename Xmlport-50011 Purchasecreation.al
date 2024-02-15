xmlport 50011 Purchasecreation
{
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = UTF16;

    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'Job';
                MinOccurs = Zero;
                UseTemporary = true;


                textelement(VendorNo)
                {
                    MinOccurs = Once;
                }
                textelement(ExternalDocNo)
                {
                    MinOccurs = Once;
                }
                textelement(TypeOfDoc)
                {
                    MinOccurs = Once;
                }
                textelement(PostingDate)
                {

                }
                textelement(Dimension1)
                {

                }
                textelement(Dimension2)
                {

                }
                textelement(shortCutDim4)
                {

                }
                textelement(types)
                {

                }
                textelement(No_Line)
                {
                }

                textelement(quantities)
                {

                }
                textelement(DirectUnitCost)
                {

                }
                // textelement(DeferralCode)
                // {

                // }
                textelement(GSTGroupCode)
                {

                }
                textelement(HSNSACCode)
                {
                    MinOccurs = Zero;
                }
                textelement(TDSSection)
                {
                    MinOccurs = Zero;
                }
                // textelement(SegmentCodeLine)
                // {
                //     MinOccurs = Zero;
                // }
                // textelement(regionCodeLine)
                // {
                //     MinOccurs = Zero;
                // }
                // textelement(ServiceCodeLine)
                // {
                //     MinOccurs = Zero;
                // }
                textelement(CustoerCode)
                {
                    MinOccurs = Zero; //New
                }
                trigger OnAfterInitRecord()
                begin
                    INT += 1;
                    IF INT = 1 THEN
                        currXMLport.SKIP;
                    Integer.Number := INT;
                end;

                trigger OnAfterInsertRecord()
                begin
                    IF LineCount <> 0 THEN BEGIN
                        EVALUATE(VarQuantity, quantities);
                        Evaluate(VarPostingDate, PostingDate);
                        Evaluate(VarDirectUnitCost, DirectUnitCost);
                        Evaluate(VarTypes, types);
                        Evaluate(VarDocType, TypeOfDoc);

                        PurchaseCreateHeader.RESET;
                        PurchaseCreateHeader.SetCurrentKey("External Document No.");
                        PurchaseCreateHeader.SetRange("External Document No.", ExternalDocNo);
                        IF PurchaseCreateHeader.FINDFIRST THEN BEGIN
                            PurchaseCreateLine.Reset();
                            PurchaseCreateLine.SetRange("Document No.", PurchaseCreateHeader."No.");
                            if PurchaseCreateLine.FindLast() then
                                CreatePurchLineNo := PurchaseCreateLine."Line No." + 10000
                            else
                                CreatePurchLineNo := PurchaseCreateLine."Line No." + 10000;

                            PurchaseCreateLine.Reset();
                            PurchaseCreateLine.Init();
                            PurchaseCreateLine.Validate("Document No.", PurchaseCreateHeader."No.");
                            PurchaseCreateLine.Validate("Line No.", CreatePurchLineNo);
                            PurchaseCreateLine.Validate("No.", No_Line);
                            PurchaseCreateLine.Validate(Type, VarTypes);
                            PurchaseCreateLine.Validate(Qunatity, VarQuantity);
                            PurchaseCreateLine.Validate("Direct Unit Cost", VarDirectUnitCost);
                            PurchaseCreateLine.Validate("GST Group Code", GSTGroupCode);
                            PurchaseCreateLine.Validate("HSN/SAC Code", HSNSACCode);
                            PurchaseCreateLine.Validate("TDS Section", TDSSection);
                            //////////
                            PurchaseCreateLine.Insert(true);
                        end else begin
                            PurchaseCreateHeader.Reset();
                            PurchaseCreateHeader.Init();
                            RecPurchpayable.Get();
                            RecPurchpayable.TESTFIELD("Purch. Creation No");
                            NextNo := NoSeriesManagement.GetNextNo(RecPurchpayable."Purch. Creation No", WORKDATE, TRUE);
                            PurchaseCreateHeader.Validate("No.", NextNo);
                            PurchaseCreateHeader.Validate("Document Type", VarDocType);
                            PurchaseCreateHeader.Validate("Vendor No.", VendorNo);
                            PurchaseCreateHeader.Validate("External Document No.", ExternalDocNo);
                            PurchaseCreateHeader.Validate("Posting Date", VarPostingDate);
                            PurchaseCreateHeader.Validate("Global Dimension Code 1", Dimension1);
                            PurchaseCreateHeader.Validate("Global Dimension Code 2", Dimension2);
                            PurchaseCreateHeader.Validate("Dimension 4 Code", shortCutDim4);
                            PurchaseCreateHeader.Validate("Customer Code", CustoerCode);
                            PurchaseCreateHeader."Created On Purchase" := false;
                            PurchaseCreateHeader.Insert(true);

                            PurchaseCreateLine.Init();
                            PurchaseCreateLine.Validate("Document No.", NextNo);
                            PurchaseCreateLine.Validate("No.", No_Line);
                            PurchaseCreateLine.Validate(Type, VarTypes);
                            PurchaseCreateLine.Validate(Qunatity, VarQuantity);
                            PurchaseCreateLine.Validate("Direct Unit Cost", VarDirectUnitCost);
                            PurchaseCreateLine.Validate("GST Group Code", GSTGroupCode);
                            PurchaseCreateLine.Validate("HSN/SAC Code", HSNSACCode);
                            PurchaseCreateLine.Validate("TDS Section", TDSSection);
                            PurchaseCreateLine.Validate("Customer Code", CustoerCode);
                            PurchaseCreateLine.Insert(true);
                        end;
                        LineCount += 1;
                    end;
                    // LineCount += 1; //Original
                end;
            }
        }
    }

    trigger OnPostXmlPort()
    begin
        MESSAGE('%1 Data has been Uploaded Successfully', (LineCount - 1));
    end;

    trigger OnPreXmlPort()
    begin
        LineCount := 1;
    end;

    var
        LineCount: Integer;
        INT: Integer;
        PurchaseCreateHeader: Record "Purchase Creation Header";
        PurchaseCreateLine: Record "Purchase Creation Line";
        VarQuantity: Decimal;
        VarPostingDate: Date;
        VarDirectUnitCost: Decimal;
        VarTypes: Enum "Purchase Line Type";
        RecPurchpayable: Record "Purchases & Payables Setup";
        NextNo: Code[20];
        NoSeriesManagement: Codeunit 396;
        CreatePurchLineNo: Integer;
        VarDocType: Enum "Purchase Document Type";
        RecDefdim: Record "Default Dimension";

}
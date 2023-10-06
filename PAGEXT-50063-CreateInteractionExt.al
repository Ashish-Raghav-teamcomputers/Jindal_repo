pageextension 50063 CrateInteractionExt extends 5077
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Sales Cycle Stage"; Rec."Sales Cycle Stage")
            {
                ApplicationArea = all;
            }
            field("Stage Description"; Rec."Stage Description")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        modify(FinishInteraction)
        {
            trigger OnbeforeAction()
            var
                RecOppoEntry: Record "Opportunity Entry";
                recIntLogEntry: Record "Interaction Log Entry";
                myInt: Integer;
            begin
                if recIntLogEntry.FindLast() then begin
                    recIntLogEntry."Sales Cycle Stage" := Rec."Sales Cycle Stage";
                    recIntLogEntry."Stage Description" := Rec."Stage Description";
                    recIntLogEntry.Modify();
                end;
            end;
        }



    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        // InteractionLogEntry."Sales Cycle Stage" := Rec."Sales Cycle Stage";
        // InteractionLogEntry."Stage Description" := Rec."Stage Description";
        // InteractionLogEntry.Modify();
    end;

    // ->17141
    trigger OnOpenPage()
    var
        OpportunityEntryRec: Record "Opportunity Entry";
    begin
        OpportunityEntryRec.SetRange(OpportunityEntryRec."Opportunity No.", Rec."Opportunity No.");
        OpportunityEntryRec.SetRange(Active, true);
        if OpportunityEntryRec.FindFirst() then begin
            rec."Sales Cycle Stage" := OpportunityEntryRec."Sales Cycle Stage";
            Rec."Stage Description" := OpportunityEntryRec."Sales Cycle Stage Description";
            CurrPage.Update();
        end;
    end;
    // <-17141
    var
        myInt: Integer;
        VarSalesCycleStage: Integer;
        VarCycleStageDesc: Text[100];
        InteractionLogEntry: Record "Interaction Log Entry";
}
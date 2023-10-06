// table 50018 "Range Filter"
table 50021 "Range Filter 2"
{
    DrillDownPageID = 50061;
    LookupPageID = 50061;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "From Days"; Integer)
        {

            trigger OnValidate()
            begin
                "From Date" := CALCDATE(FORMAT(-"From Days") + 'D', TODAY);
            end;
        }
        field(3; "To Days"; Integer)
        {

            trigger OnValidate()
            begin
                "To Date" := CALCDATE(FORMAT(-"To Days") + 'D', TODAY);
            end;
        }
        field(4; "From Date"; Date)
        {
        }
        field(5; "To Date"; Date)
        {
        }
        field(60000; "Link Table"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}


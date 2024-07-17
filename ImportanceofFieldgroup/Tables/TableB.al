table 60000 TableB
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Gender; option)
        {
            OptionMembers = Male,Female;
            OptionCaption = 'Male,Famale';

        }
        field(4; "Table A Ref"; code[20])
        {
            TableRelation = TableA;

        }

    }

    keys
    {
        key(Key1; id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
       
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
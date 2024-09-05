tableextension 60088 MyExtension extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(88888; "Full Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin

            end;

            trigger OnLookup()
            begin

            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    
}
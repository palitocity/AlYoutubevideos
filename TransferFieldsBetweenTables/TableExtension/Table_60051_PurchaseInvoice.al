tableextension 60051 "Posted Purchase Invoice" extends "Purch. Inv. Header"
{
    fields
    {
        // Add changes to table fields here
        field(50080; "Other Description"; Text[100])
        {
            DataClassification = ToBeClassified;
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
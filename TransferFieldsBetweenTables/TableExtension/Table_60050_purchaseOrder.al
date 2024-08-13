tableextension 60050 "Purchase Order Ext" extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Other Description"; Text[100])
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
tableextension 60052 "Customer list ext" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Blood Group"; Enum "Blood Group")
        {

        }
        field(50001; item; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item.Description;
        }
        //   field(50002; "item name"; code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     Editable = false;
        // }
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
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';

    trigger OnAfterInsert()
    begin

    end;

    trigger OnBeforeInsert()
    begin

    end;

    trigger OnInsert()
    begin

    end;
}
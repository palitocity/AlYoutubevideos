pageextension 60051 "Posted Purchase inv ext" extends "Posted Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Invoice No.")
        {
            field("Other Description"; Rec."Other Description")
            {
                ApplicationArea = Basic, Suite;
                MultiLine = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';
}
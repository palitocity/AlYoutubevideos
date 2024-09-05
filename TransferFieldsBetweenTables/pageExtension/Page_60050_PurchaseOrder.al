pageextension 60050 "Purchase Order ext" extends "Purchase Order"
{
    layout
    {

        addbefore(Prepayment)
        {

        }
        // Add changes to page layout here
        addafter("Vendor Invoice No.")
        {
            field("Other Description"; Rec."Other Description")
            {
                ApplicationArea = Basic, Suite;
                MultiLine = true;
                trigger OnValidate()
                var
                    fieldRef: FieldRef;
                    refRefrence: RecordRef;
                    id: Integer;
                begin
                    id := rec.FieldNo("Other Description");

                end;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast("Dr&op Shipment")
        {
            action("work with Ref & variant")
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                trigger OnAction()
                var
                    RecRef: RecordRef;
                    noFace: Variant;
                    string: Text;
                begin
                    string := 'palitocity';
                    RecRef.GetTable(Rec);
                    Message(format(RecRef.RecordId));
                    noFace := string;
                    if noFace.IsRecord then Message('i am a record') else Message(noFace);

                end;
            }
        }
    }

    var
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';
}
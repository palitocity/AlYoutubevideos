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
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';


    procedure EchoName(username: Text)
    var
        IsHandled: Boolean;
    begin
        Message('Original name is %1', username);

        onBeforeAlterEchoNameFunction(username);

        Message('Changed name is %1', username);

        onAfterAlterEchoNameFunction(username);

        Message('Final name is %1', username);

    end;

    [IntegrationEvent(true, false)]
    local procedure onBeforeAlterEchoNameFunction(Var username: Text)
    begin

    end;

    [IntegrationEvent(true, false)]
    local procedure onAfterAlterEchoNameFunction(Var username: Text)
    begin

    end;

}
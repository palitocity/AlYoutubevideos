codeunit 60001 "Eventsin Customization"
{

    local procedure MyProcedure()
    var
        myInt: array[10, 10] of Text;
    begin

    end;



    [EventSubscriber(ObjectType::Table, Database::TableB, 'onAfterAlterEchoNameFunction', '', false, false)]
    local procedure onAfterAlterEchoNameFunction(var username: Text)
    begin
        username := 'Daniel';
        Message('onAfterAlterEchoNameFunction changed the name to %1', username);
    end;

    [EventSubscriber(ObjectType::Table, Database::TableB, 'onBeforeAlterEchoNameFunction', '', false, false)]
    local procedure onBeforeAlterEchoNameFunction(var username: Text)
    begin
        username := 'Ope';
        Message('onBeforeAlterEchoNameFunction changed the name to %1', username);

    end;
}
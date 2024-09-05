codeunit 60051 "Retrive Occurance"
{
    //Built by palitocity
    Description = 'Codeunit is responsible for retriving data occurance in different format';


    procedure RetriveDistinctValuesAndCount(RecRefrence: Variant; fieldValue: Integer) ResultObject: JsonArray
    var
        RecordRef: RecordRef;
        fieldRef: FieldRef;
        Seed: list of [Text];
        count: Integer;
        NoOfRepeat: Integer;
        ResultArray: JsonArray;
    begin
        Clear(Seed);
        Clear(count);
        Clear(NoOfRepeat);
        // case RecRefrence of
        if RecRefrence.IsRecord then begin
            begin
                RecordRef.GetTable(RecRefrence);
                if RecordRef.IsEmpty then exit;
                repeat
                    fieldRef := RecordRef.Field(fieldValue);
                    if Format(fieldRef.Value) <> '' then begin
                        if not Seed.Contains(fieldRef.Value) then begin
                            Seed.Add(fieldRef.Value);
                        end
                    end
                until RecordRef.Next() = 0;

                Clear(fieldRef);

                for count := 1 to Seed.Count do begin
                    Clear(NoOfRepeat);
                    if RecordRef.FindSet() then begin
                        repeat
                            fieldRef := RecordRef.Field(fieldValue);

                            if (Seed.Contains(fieldRef.Value)) then begin
                                NoOfRepeat += 1;
                            end;

                        until RecordRef.Next() = 0;
                    end;
                    ResultArray.Add(Seed.Get(count));
                    ResultArray.Add(NoOfRepeat);
                    ResultObject.Add(ResultArray.AsToken())
                end;

            end;
        end;


        // RecRefrence.IsRecordId:
        //     begin
        //         Clear(Seed);
        //         RecordRef.Open(RecRefrence);
        //         if RecordRef.IsEmpty then exit;
        //         repeat
        //             fieldRef := RecordRef.Field(fieldValue);
        //             if not Seed.Contains(fieldRef.Value) then begin
        //                 Seed.Add(fieldRef.Value);
        //             end
        //         until RecordRef.Next() = 0;
        //         Clear(fieldRef);

        //         for count := 1 to Seed.Count do begin
        //             repeat
        //                 fieldRef := RecordRef.Field(fieldValue);
        //                 if Seed.Get(count) = Format(fieldRef.Value) then begin
        //                     NoOfRepeat += 1;
        //                 end;
        //             until RecordRef.Next() = 0;
        //             ResultArray.Add(Seed.Get(count));
        //             ResultArray.Add(NoOfRepeat);
        //             ResultObject.Add(ResultArray.AsToken())
        //         end;

        //     end;
        // RecRefrence.IsRecordRef:
        //     begin
        //         Clear(Seed);
        //         if RecordRef.IsEmpty then exit;
        //         repeat
        //             fieldRef := RecordRef.Field(fieldValue);
        //             if not Seed.Contains(fieldRef.Value) then begin
        //                 Seed.Add(fieldRef.Value);
        //             end
        //         until RecordRef.Next() = 0;
        //         Clear(fieldRef);

        //         for count := 1 to Seed.Count do begin
        //             repeat
        //                 fieldRef := RecordRef.Field(fieldValue);
        //                 if Seed.Get(count) = Format(fieldRef.Value) then begin
        //                     NoOfRepeat += 1;
        //                 end;
        //             until RecordRef.Next() = 0;
        //             ResultArray.Add(Seed.Get(count));
        //             ResultArray.Add(NoOfRepeat);
        //             ResultObject.Add(ResultArray.AsToken())
        //         end;

        //     end;

        // end;

    end;


    var
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';
}
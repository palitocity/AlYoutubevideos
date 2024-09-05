table 60001 TableA
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
            trigger OnValidate()
            var
                TableA: Record TableA;
            begin
                // if TableA.Get(Name) then begin
                //     Message('Table A Rec, %1', TableA.id);
                // end;

                // TableA.SetCurrentKey(Name);
                // TableA.SetRange(Name, '1000','2000');

                // TableA.SetFilter(Name,'>%1 <> %2','1000','3000' );

                // if TableA.Count > 1 then begin 


                // end



            end;

        }


        /*

        isEmpty

         GET

TABLE.GET()






         SETRANGE



         SETFILTER

        
        
        */

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
        fieldgroup(DropDown; id, Name, Gender) { }

    }

    var
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';

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
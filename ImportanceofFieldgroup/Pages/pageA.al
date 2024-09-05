page 60003 "Page A Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TableA;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field.', Comment = '%';
                    trigger OnValidate()
                    begin

                    end;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';
}
page 60001 "Page B Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TableB;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Table A Ref"; Rec."Table A Ref")
                {
                    ToolTip = 'Specifies the value of the Table A Ref field.', Comment = '%';
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
        myInt: Integer;
}
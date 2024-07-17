page 60000 PageB
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TableB;
    Editable = false;
    CardPageId = "Page B Card";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
        area(Factboxes)
        {

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
}
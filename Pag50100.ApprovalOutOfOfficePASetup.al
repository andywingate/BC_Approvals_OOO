page 50100 ApprovalOutOfOfficePASetup
{
    Caption = 'Approval Out Of Office PA Setup';
    PageType = Card;
    SourceTable = ApprovalOutOfOfficePASetup;
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Enable Out of Office Auto-Delegate"; Rec.EnableOOO)
                {
                    ToolTip = 'Specifies the value of the Enable Out of Office Auto-Delegate field.', Comment = '%';
                }

            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}

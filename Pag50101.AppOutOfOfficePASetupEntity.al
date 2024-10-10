page 50101 AppOutOfOfficePASetupEntity
{
    Caption = 'approvalOutOfOfficePASetup';
    DelayedInsert = true;
    EntityName = 'ApprovalOutOfOfficePASetup';
    EntitySetName = 'ApprovalOutOfOfficePASetups';
    ODataKeyFields = SystemId;
    APIGroup = 'pa';
    APIPublisher = 'wingate365';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    PageType = API;
    SourceTable = ApprovalOutOfOfficePASetup;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = all;
                    Caption = 'SystemId', Locked = true;
                    Editable = false;
                }
                field(enableOOO; Rec.EnableOOO)
                {
                    ApplicationArea = All;
                    Caption = 'Enable Out of Office Auto-Delegate', Locked = true;
                }
            }
        }
    }
    [ServiceEnabled]

    procedure OOODelegate(var actionContext: WebServiceActionContext)
    var
        Item: Record Item;
    begin
        Item.get('1896-S');
        Item.Description := Item.Description + '_ADW';
        item.Modify();

        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

}

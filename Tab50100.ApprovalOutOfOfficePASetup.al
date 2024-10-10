table 50100 ApprovalOutOfOfficePASetup
{
    Caption = 'ApprovalOutOfOfficePASetup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; EnableOOO; Boolean)
        {
            Caption = 'Enable Out of Office Auto-Delegate';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}

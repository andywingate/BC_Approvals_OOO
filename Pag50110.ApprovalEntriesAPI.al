// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Automation;

using System.Security.User;

page 50110 "Approval Entries API"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Approval Entry API';
    EntitySetCaption = 'Approval Entries API';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'approvalEntry';
    EntitySetName = 'approvalEntries';
    APIPublisher = 'wingate365';
    APIGroup = 'apiActions';
    PageType = API;
    SourceTable = "Approval Entry";
    Extensible = false;
    ApplicationArea = Suite;
    Caption = 'Approval Entries';
    ODataKeyFields = SystemId;


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("TableID"; Rec."Table ID")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the ID of the table where the record that is subject to approval is stored.';
                    Visible = false;
                }
                field("LimitType"; Rec."Limit Type")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the type of limit that applies to the approval template:';
                }
                field("ApprovalType"; Rec."Approval Type")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies which approvers apply to this approval template:';
                }
                field("DocumentType"; Rec."Document Type")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the type of document that an approval entry has been created for. Approval entries can be created for six different types of sales or purchase documents:';
                    Visible = false;
                }
                field("DocumentNo"; Rec."Document No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the document number copied from the relevant sales or purchase document, such as a purchase order or a sales quote.';
                    Visible = false;
                }

                field(Details; Rec.RecordDetails())
                {
                    ApplicationArea = Suite;
                    Caption = 'Details';
                    ToolTip = 'Specifies the record that the approval is related to.';
                }
                field("SequenceNo"; Rec."Sequence No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the order of approvers when an approval workflow involves more than one approver.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the approval status for the entry:';
                }
                field("SenderID"; Rec."Sender ID")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the ID of the user who sent the approval request for the document to be approved.';

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation(Rec."Sender ID");
                    end;
                }
                field("SalespersPurchCode"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the salesperson or purchaser that was in the document to be approved. It is not a mandatory field, but is useful if a salesperson or a purchaser responsible for the customer/vendor needs to approve the document before it is processed.';
                }
                field("ApproverID"; Rec."Approver ID")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the ID of the user who must approve the document.';

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation(Rec."Approver ID");
                    end;
                }
                field("CurrencyCode"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code of the currency of the amounts on the sales or purchase lines.';
                }
                field("AmountLCY"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the total amount (excl. VAT) on the document awaiting approval. The amount is stated in the local currency.';
                }
                field("AvailableCreditLimitLCY"; Rec."Available Credit Limit (LCY)")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the remaining credit (in LCY) that exists for the customer.';
                }
                field("DateTimeSentforApproval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date and the time that the document was sent for approval.';
                }
                field("LastDateTimeModified"; Rec."Last Date-Time Modified")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date when the approval entry was last modified. If, for example, the document approval is canceled, this field will be updated accordingly.';
                }
                field("LastModifiedByUserID"; Rec."Last Modified By User ID")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the ID of the user who last modified the approval entry. If, for example, the document approval is canceled, this field will be updated accordingly.';

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation(Rec."Last Modified By User ID");
                    end;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies whether there are comments relating to the approval of the record. If you want to read the comments, choose the field to open the Approval Comment Sheet window.';
                }
                field("DueDate"; Rec."Due Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies when the record must be approved, by one or more approvers.';
                }
                field(SystemId; Rec.SystemId)
                {

                }
            }
        }

    }


    local procedure delegate(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //CurrPage.SetSelectionFilter(ApprovalEntry);
        ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure delegateBound(var ActionContext: WebServiceActionContext)
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        delegate(ApprovalEntry);
    end;

}


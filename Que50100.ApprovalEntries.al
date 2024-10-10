query 50100 ApprovalEntries
{
    APIGroup = 'pa';
    APIPublisher = 'wingate365';
    APIVersion = 'v1.0';
    EntityName = 'approvalEntryq';
    EntitySetName = 'approvalEntriesq';
    QueryType = API;

    elements
    {
        dataitem(approvalEntry; "Approval Entry")
        {
            column(amount; Amount)
            {
            }
            column(amountLCY; "Amount (LCY)")
            {
            }
            column(approvalCode; "Approval Code")
            {
            }
            column(approvalType; "Approval Type")
            {
            }
            column(approverID; "Approver ID")
            {
            }
            column(availableCreditLimitLCY; "Available Credit Limit (LCY)")
            {
            }
            column(comment; Comment)
            {
            }
            column(currencyCode; "Currency Code")
            {
            }
            column(dateTimeSentForApproval; "Date-Time Sent for Approval")
            {
            }
            column(delegationDateFormula; "Delegation Date Formula")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(documentType; "Document Type")
            {
            }
            column(dueDate; "Due Date")
            {
            }
            column(entryNo; "Entry No.")
            {
            }
            column(lastDateTimeModified; "Last Date-Time Modified")
            {
            }
            column(lastModifiedByUserID; "Last Modified By User ID")
            {
            }
            column(limitType; "Limit Type")
            {
            }
            column(numberOfApprovedRequests; "Number of Approved Requests")
            {
            }
            column(numberOfRejectedRequests; "Number of Rejected Requests")
            {
            }
            column(pendingApprovals; "Pending Approvals")
            {
            }
            column(recordIDToApprove; "Record ID to Approve")
            {
            }
            column(relatedToChange; "Related to Change")
            {
            }
            column(salespersPurchCode; "Salespers./Purch. Code")
            {
            }
            column(senderID; "Sender ID")
            {
            }
            column(sequenceNo; "Sequence No.")
            {
            }
            column(status; Status)
            {
            }
            column(systemCreatedAt; SystemCreatedAt)
            {
            }
            column(systemCreatedBy; SystemCreatedBy)
            {
            }
            column(systemId; SystemId)
            {

            }
            column(systemModifiedAt; SystemModifiedAt)
            {
            }
            column(systemModifiedBy; SystemModifiedBy)
            {
            }
            column(tableID; "Table ID")
            {
            }
            column(workflowStepInstanceID; "Workflow Step Instance ID")
            {
            }
        }
    }


    trigger OnBeforeOpen()
    begin

    end;
}

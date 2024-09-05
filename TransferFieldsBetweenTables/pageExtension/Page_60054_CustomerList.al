pageextension 60054 "Cust List extension" extends "Customer List"
{
    Caption = 'Patient Records';
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("Blood Group"; Rec."Blood Group")
            {
                ApplicationArea = all;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
        addlast("&Customer")
        {
            action(Post)
            {
                ApplicationArea = all;
                Promoted = true;
                Caption = 'Post Journal';
                trigger OnAction()
                var
                    JournalLine: Record "Gen. Journal Line";
                    JournalTemplate: Record "Gen. Journal Template";
                    JournalBatch: Record "Gen. Journal Batch";
                    lineNo: Integer;
                begin
                    if not JournalTemplate.Get('Demo') then begin
                        JournalTemplate.Reset();
                        JournalTemplate.Init();
                        JournalTemplate.Name := 'Demo';
                        JournalTemplate.Description := 'Demo Template';
                        JournalTemplate.Insert();
                    end;

                    JournalBatch.SetRange("Journal Template Name", 'Demo');
                    JournalBatch.SetRange(Name, 'Demo Batch');
                    if not JournalBatch.FindFirst() then begin
                        JournalBatch.Reset();
                        JournalBatch.Init();
                        JournalBatch."Journal Template Name" := 'Demo';
                        JournalBatch.Name := 'Demo Batch';
                        JournalBatch.Description := 'Demo Batch';
                        JournalBatch.Insert();
                    end;
                    JournalLine.DeleteAll();
                    lineNo := 10000;
                    JournalLine.Reset();
                    JournalLine.Init();
                    JournalLine."Journal Template Name" := 'Demo';
                    JournalLine."Journal Batch Name" := 'Demo Batch';
                    JournalLine."Line No." := lineNo;
                    JournalLine."Posting Date" := Today;
                    JournalLine."Document Date" := Today;
                    JournalLine."Document Type" := JournalLine."Document Type"::" ";
                    JournalLine."Document No." := 'palitocity';
                    JournalLine."Account Type" := JournalLine."Account Type"::"G/L Account";
                    JournalLine."Account No." := '22100';
                    JournalLine.Amount := 20000;
                    JournalLine."System-Created Entry" := true;
                    JournalLine."Bal. Account Type" := JournalLine."Bal. Account Type"::"Bank Account";
                    JournalLine."Bal. Account No." := 'GTB BANK';
                    JournalLine.Insert();
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", JournalLine)
                end;

            }
            action(getWeeks)
            {
                ApplicationArea = all;
                Promoted = true;
                Caption = 'Retrive data';
                trigger OnAction()
                var
                    TodayDate: Date;
                begin
                    Message(Format(StrSubstNo('%1', Round(Date2DWY(Today, 2) / Date2DMY(Today, 2), 1))));
                end;
            }
            action(RetriveDat)
            {

                ApplicationArea = all;
                Promoted = true;
                Caption = 'Retrive data';
                trigger OnAction()
                var
                    SalesLines: Record "Sales Line";
                    RetriveDistCustomer: List of [Text];

                begin

                    // SalesLines.SetRange("Document Type", SalesLines."Document Type"::Quote);
                    SalesLines.SetCurrentKey("Document Type", Quantity);
                    SalesLines.SetFilter("Document Type", '%1|%2', SalesLines."Document Type"::Quote, SalesLines."Document Type"::Order);
                    SalesLines.SetRange(Quantity, 4, 500);

                    if SalesLines.FindSet() then begin

                        repeat
                            if not RetriveDistCustomer.Contains(SalesLines."Sell-to Customer No.") then begin
                                RetriveDistCustomer.Add(SalesLines."Sell-to Customer No.");
                            end
                        until SalesLines.Next() = 0;

                        Message('%1 customer is responsible for the sales total of %2 ', RetriveDistCustomer.Count, SalesLines.Count);
                    end

                    // if not SalesLines.IsEmpty then begin
                    //     if SalesLines.FindSet() then begin
                    //         Message(Format(SalesLines.Count));
                    //     end
                    // end
                end;

            }
        }
    }

    var
        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';
}
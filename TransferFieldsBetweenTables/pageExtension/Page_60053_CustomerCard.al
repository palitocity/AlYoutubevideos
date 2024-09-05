pageextension 60053 "Cust card extension" extends "Customer Card"
{
    Caption = 'Patient Profile';

    layout
    {
        // Add changes to page layout here

        moveafter(City; "Credit Limit (LCY)")
        movebefore("E-Mail"; "Balance Due")
        movefirst("Address & Contact"; "CustSalesLCY - CustProfit - AdjmtCostLCY", "E-Mail", Name)
        // movelast("Address & Contact"; Name)

        addafter(General)
        {
            group(palitocity)
            {

                field("Blood Group"; Rec."Blood Group")
                {
                    ApplicationArea = all;
                }
                field(item; Rec.item)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the item field.', Comment = '%';
                }


            }

            //  Abc






        }

        moveafter("No."; "Home Page")

        modify("Address 2")
        {
            Caption = 'Another Address';
        }
        modify("Fax No.")
        {
            Visible = true;
        }
        modify(Payments)
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Customer")
        {


        }
    }

    var

        documentNumber: code[20];



        requiredLineWarning: Label 'You are required to expense the individual company share on the line of this document!';


    local procedure makeDecision()
    var
        patientType: Option inpatient,outpatient;
    begin

        documentNumber := 'pat/in/001';

        if patientType = patientType::outpatient then begin

        end;

        case patientType of
            patientType::inpatient:
                begin

                end;
            patientType::outpatient:
                begin

                end;
        end;

        // if Format(documentNumber).IndexOf('in') =1
        if Format(documentNumber).Contains('in') then begin

        end
        else if Format(documentNumber).Contains('out') then begin

        end

    end;



    local procedure InsertNewInvoice()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesReceivableSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        SalesReceivableSetup.Get();
        SalesHeader.Reset();
        SalesHeader.init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader."No." := NoSeriesMgt.GetNextNo(SalesReceivableSetup."Invoice Nos.");
        SalesHeader.Validate("Sell-to Customer No.", Rec."No.");
        SalesHeader."Posting Date" := Today;
        if SalesHeader.Insert() then begin
            SalesLine.Reset();
            SalesLine.init();
            SalesLine."Document Type" := SalesHeader."Document Type";
            SalesLine."Document No." := SalesHeader."No.";
            SalesLine."Line No." := 10000;

        end







    end;




}
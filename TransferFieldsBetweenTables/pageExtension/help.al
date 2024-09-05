// procedure PostBankTransfer(PCASH: Record Payments)
//  var
//  PCASHLines: Record "PV Lines";
//  GenJnLine: Record "Gen. Journal Line";
//  LineNo: Integer;
//  VATSetup: Record "VAT Posting Setup";
//  GLAccount: Record "G/L Account";
//  Customer: Record Customer;
//  Vendor: Record Vendor;
//  GLEntry: Record "G/L Entry";
//  CMSetups: Record "Cash Management Setup";
//  DocPrint: Codeunit "Document-Print";
//  begin
//  if Confirm('Are u sure u want to post this InterBank Transfer' + PCASH."No." + ' ?') = true then begin
//  if PCASH.Status <> PCASH.Status::Released then
//  Error('The InterBank Transfer No %1 has not been fully approved', PCASH."No.");
//  if PCASH.Posted then
//  Error('InterBank Transfer %1 has been posted', PCASH."No.");
//  PCASH.TestField(Date);
//  PCASH.TestField("Paying Bank Account");
//  //PCASH.TESTFIELD(PCASH.Payee);
//  PCASH.TestField(PCASH."Pay Mode");
//  PCASH.TestField(PCASH."Posting Date");
//  if PCASH."Pay Mode" = 'CHEQUE' then begin
//  PCASH.TestField(PCASH."Cheque Date");
//  end;

//  //Check Lines
//  PCASH.CalcFields("Total Amount LCY");
//  if PCASH."Total Amount LCY" = 0 then
//  Error('Amount is cannot be zero');
//  PCASHLines.Reset;
//  PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
//  if not PCASHLines.FindLast then
//  Error('InterBank Transfer Lines cannot be empty');

//  CMSetup.Get();
//  // Delete Lines Present on the General Journal Line
//  GenJnLine.Reset;
//  GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank TR Journal Template");
//  GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
//  GenJnLine.DeleteAll;

//  //Bank Entries
//  LineNo := LineNo + 1000;
//  PCASH.CalcFields(PCASH."Total Amount LCY");

//  PCASHLines.Reset;
//  PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
//  // why are you validating ?
//  PCASHLines.Validate(PCASHLines.Amount);
//  // is the amount a flow field ?
//  PCASHLines.CalcSums(PCASHLines.Amount);

//  //message the amount at this point then use end ;




//  GenJnLine.Init;
//  if CMSetup.Get then
//  GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
//  GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
//  GenJnLine."Line No." := LineNo;
//  GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
//  GenJnLine."Account No." := PCASHLines."Account No";
//  GenJnLine.Validate(GenJnLine."Account No.");
//  if PCASH.Date = 0D then
//  Error('You must specify the Transfer date');
//  //Ruth

//  // if PCASH."Pay Mode" = 'CHEQUE' then
//  // GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";


 
//  GenJnLine.Validate("Currency Code");
//  GenJnLine."Posting Date" := PCASH."Posting Date";
//  GenJnLine."Document No." := PCASH."No.";
//  GenJnLine."External Document No." := PCASH."No.";
//  GenJnLine."Payment Method Code" := PCASH."Pay Mode";
//  //use paye field
//  /*
//  PCASH.CALCFIELDS("Bank Name");*/
//  GenJnLine.Description := PCASH.Payee;
//  GenJnLine.Amount := PCASHLines.Amount;
//  GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
//  GenJnLine."Bal. Account No." := PCASH."Paying Bank Account";
//  GenJnLine.Validate(GenJnLine."Bal. Account No.");
//  GenJnLine.Validate(GenJnLine.Amount);//

//  GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
//  GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
//  GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
//  GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

//  GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
//  GenJnLine.Validate(GenJnLine."Dimension Set ID");

//  if GenJnLine.Amount <> 0 then
//  GenJnLine.Insert;


//  Commit();


//  //loop to print check
//  GenJnLine.Reset;
//  GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
//  GenJnLine.SetRange("Check Printed", false);
//  if GenJnLine.FindSet then begin
//  repeat
//  CMSetup.Get;

//  PrintCheck(GenJnLine, CMSetup."Bank TR Journal Template", CMSetup."Bank TR Journal Batch Name");

//  PCASHLines.SetRange(No, PCASHLines.No);
//  if PCASHLines.FindSet then begin
//  PCASHLines."Check No" := GenJnLine."Document No.";
//  PCASHLines."Check Printed" := true;
//  PCASHLines.Modify();
//  end;
//  until GenJnLine.Next = 0;
//  end;

//  GenJnLine.Reset;
//  GenJnLine.SetRange("Journal Template Name", CMSetup."Bank TR Journal Template");
//  GenJnlLine.SetRange("Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
//  if GenJnLine.FindSet then begin
//  //Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
//  Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnLine)

//  end;
//  if PCASH."Pay Mode" = 'CHEQUE' then begin
//  BALedgerEntry.Reset;
//  BALedgerEntry.SetRange("External Document No.", PCASH."No.");
//  if BALedgerEntry.FindSet then begin
//  PCASH."Cheque No" := BALedgerEntry."Document No.";
//  PCASH.Posted := true;
//  PCASH."Posted By" := UserId;
//  PCASH."Posted Date" := Today;
//  PCASH."Time Posted" := Time;
//  PCASH.Modify;

//  end;
//  end else

//  //check entries on the ledger
//  BALedgerEntry.Reset;
//  BALedgerEntry.SetRange("Document No.", PCASH."No.");
//  if BALedgerEntry.FindFirst then begin
//  PCASH.Posted := true;
//  PCASH."Posted By" := UserId;
//  PCASH."Posted Date" := Today;
//  PCASH."Time Posted" := Time;
//  PCASH.Modify;
//  end;

//  END;
//  */
//  //END;


//  end;


// }
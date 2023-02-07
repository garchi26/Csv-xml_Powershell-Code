$xml_template=@"
<?xml version="1.0" encoding="utf-8"?>
<root>
@@BOOKNODES@@
</root>
"@

$book_template=@"
<row>
  <col1>{0}</col1>
  <col2>{1}</col2>
  <col3>{2}</col3>
  <col4>{3}</col4>
  <col5>{4}</col5>
  <col6>{5}</col6>
</row>
"@

$xml_path="C:\Users\Windows 11\Desktop\data_test.xml"
$csv_path="C:\Users\Windows 11\Desktop\data_test.csv"

$data= Import-csv -path $csv_path -Header A,B,C,D,E,F

$books= foreach ($book in $data){

$book_template -f $book.A, $book.B, $book.C, $book.D, $book.E, $book.F
} 

#Upload the data into xml file
$xml_template -replace '@@BOOKNODES@@',($books -join [environment]::NewLine) | Set-Content -Path $xml_path -Encoding utf8
section Section1;

shared Orders_details = let
    Source = Excel.Workbook(File.Contents("D:\Min_Progect\Sample - Superstore 2019.xls"), null, true),
    Orders1 = Source{[Name="Orders"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Orders1, [PromoteAllScalars=true]),
    #"Removed Columns" = Table.RemoveColumns(#"Promoted Headers",{"Row ID"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Columns",{{"Order Date", type date}, {"Ship Date", type date}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Order ID", "order_id"}, {"Order Date", "order_date"}, {"Ship Date", "ship_date"}, {"Ship Mode", "ship_model"}, {"Customer ID", "customer_id"}, {"Customer Name", "customer_name"}, {"Segment", "segment"}, {"Country/Region", "country"}, {"City", "city"}, {"State", "state"}, {"Postal Code", "postal_code"}, {"Region", "region"}, {"Product ID", "product_id"}, {"Category", "category"}, {"Product Name", "product_name"}, {"Sales", "sales"}, {"Quantity", "quantity"}, {"Discount", "discount"}, {"Profit", "profit"}}),
    #"Removed Duplicates" = Table.Distinct(#"Renamed Columns"),
    #"Removed Blank Rows" = Table.SelectRows(#"Removed Duplicates", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null}))),
    #"Replaced Value" = Table.ReplaceValue(#"Removed Blank Rows",null,"UnKnown",Replacer.ReplaceValue,{"postal_code"}),
    #"Trimmed Text" = Table.TransformColumns(#"Replaced Value",{{"order_id", Text.Trim, type text}, {"ship_model", Text.Trim, type text}, {"customer_id", Text.Trim, type text}, {"customer_name", Text.Trim, type text}, {"segment", Text.Trim, type text}, {"country", Text.Trim, type text}, {"city", Text.Trim, type text}, {"state", Text.Trim, type text}, {"postal_code", Text.Trim, type text}, {"region", Text.Trim, type text}, {"product_id", Text.Trim, type text}, {"category", Text.Trim, type text}, {"Sub-Category", Text.Trim, type text}, {"product_name", Text.Trim, type text}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Trimmed Text",{{"sales", type number}, {"quantity", Int64.Type}, {"discount", Percentage.Type}, {"profit", type number}})
in
    #"Changed Type1";

shared Sales_Rep = let
    Source = Excel.Workbook(File.Contents("D:\Min_Progect\Sample - Superstore 2019.xls"), null, true),
    People1 = Source{[Name="People"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(People1,{{"Column1", type text}, {"Column2", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"Person", type text}, {"Region", type text}})
in
    #"Changed Type1";

shared Returns = let
    Source = Excel.Workbook(File.Contents("D:\Min_Progect\Sample - Superstore 2019.xls"), null, true),
    Returns1 = Source{[Name="Returns"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(Returns1,{{"Column1", type text}, {"Column2", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"Returned", type text}, {"Order ID", type text}}),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type1")
in
    #"Removed Duplicates";
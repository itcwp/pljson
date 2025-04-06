--Example 8 Loops
DECLARE
   Obj Pljson := Pljson('{
  "a" : true,
  "b" : [5,7,"3"],
  "c" : {
    "d" : [["array of array"], null, { "e": 7913 }]
  },
  "custom_attributes" : [{
    "attribute_code" : "reward_update_notification",
    "value" : "0"
  }, {
    "attribute_code" : "coach_rule_video_watched",
    "value" : "1"
  }, {
    "attribute_code" : "coach_rule_starter_kit_purchased",
    "value" : "1"
  }, {
    "attribute_code" : "account_name",
    "value" : "karamba"
  }, {
    "attribute_code" : "sort_code",
    "value" : "12-34-56"
  }, {
    "attribute_code" : "vat_details",
    "value" : "GB123456789"
  }, {
    "attribute_code" : "account_number",
    "value" : "1234567890"
  }, {
    "attribute_code" : "user_token",
    "value" : "eyJ0b2tlbiI6IlVUZW85OGtpNWtMVkVnb3pzVHhOQnRPVGY3TWVzQWlnIiwiZXhwaXJhdGlvblRpbWUiOiIyMDI1LTAzLTIzIDE0OjEzOjE5In0="
  }, {
    "attribute_code" : "coach_url_key",
    "value" : "matimati1"
  }, {
    "attribute_code" : "flawless_id",
    "value" : "487dd67e-112d-4479-8ba9-4c986ef0aac8"
  }, {
    "attribute_code" : "sponsor_id",
    "value" : "778f2d2d-8484-43cc-90d1-35f89b3dca12"
  }]
}');

   Printme NUMBER := NULL;
   String1 VARCHAR2(200) := NULL;

   Attribue_List Pljson_List;

BEGIN
   Printme := Pljson_Ext.Get_Number(Obj, 'b[3]');
   String1 := Pljson_Ext.Get_String(Obj, 'b[3]');
   Dbms_Output.Put_Line('Printme = ' || Printme || '   string1 = ' || String1);
   IF (Printme IS NULL)
   THEN
      Dbms_Output.Put_Line('Printme is NULL');
      Printme := Pljson_Ext.Get_Number(Obj, 'c.d[3].e');
      Dbms_Output.Put_Line('Printme value = ' || Printme);
   END IF;
   IF (Printme IS NOT NULL)
   THEN
      Dbms_Output.Put_Line('Printme is now not NULL');
      Dbms_Output.Put_Line('c.d[3].e= ' || Printme);
   END IF;


   Attribue_List := Pljson_Ext.Get_Json_List(Obj, 'custom_attributes');
   Dbms_Output.Put_Line('Count = ' || Attribue_List.Count);

   FOR i IN 1 .. Attribue_List.Count
   LOOP
      Pljson(Attribue_List.Get(i)).Get('attribute_code').Print;
      Pljson(Attribue_List.Get(i)).Get('value').Print;
   
   END LOOP;

   Dbms_Output.Put_Line('-------------------------------------------------');
   FOR i IN 1 .. Attribue_List.Count
   LOOP
      Dbms_Output.Put_Line('attribute_code->' || Pljson_Ext.Get_String(Pljson(Attribue_List.Get(i)), 'attribute_code'));
      Dbms_Output.Put_Line('value->' || Pljson_Ext.Get_String(Pljson(Attribue_List.Get(i)), 'value'));
   END LOOP;
END;



/*
DECLARE
   Json_Data2 Pljson;
   Json_Data  Pljson := Pljson('{   "foo": "bar",   "list": [     {"key": "value1"},     {"key": "value2"}   ] }');
   List_Value Pljson_List;
BEGIN
   List_Value := Pljson_Ext.Get_Json_List(Json_Data, 'list');

   Dbms_Output.Put_Line('Count = ' || List_Value.Count);

   FOR i IN 1 .. List_Value.Count
   LOOP
      -- json_data2 := json(list_value.get(i));
      Pljson(List_Value.Get(i)).Get('key').Print;
      -- dbms_output.put_line('key = ' || json_data2.get('key')); -- "key = value"
   -- json_data2.get('key').print;
   END LOOP;
END;
*/

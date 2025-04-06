
DECLARE
   Obj        Pljson := Pljson('{"info_any": {"middleName": "Wolfgang","lastName": "Munster","addresses": [{"city": "Corby","state": "CA","addressType": "home","street2": "my street","street1": "1313 Mockingbird Lane"},{"city": "Northampton","state": "CA","addressType": "business","street2": "Second street","street1": "123 Morgan Rd."}],"firstName": "Edward"}}');
   List_Value Pljson_List;
BEGIN

   Obj := Pljson(Obj.Get('info_any'));

   Dbms_Output.Put_Line('firstName->' || Pljson_Ext.Get_String(Obj, 'firstName'));
   Dbms_Output.Put_Line('middleName->' || Pljson_Ext.Get_String(Obj, 'middleName'));
   Dbms_Output.Put_Line('lastName->' || Pljson_Ext.Get_String(Obj, 'lastName'));
   Dbms_Output.Put_Line('-------------------------------------------------');

   List_Value := Pljson_List(Obj.Get('addresses'));

   FOR i IN 1 .. List_Value.Count
   LOOP
   
      Dbms_Output.Put_Line('addressType->' || Pljson_Ext.Get_String(Pljson(List_Value.Get(i)), 'addressType'));
      Dbms_Output.Put_Line('street1->' || Pljson_Ext.Get_String(Pljson(List_Value.Get(i)), 'street1'));
      Dbms_Output.Put_Line('street2->' || Pljson_Ext.Get_String(Pljson(List_Value.Get(i)), 'street2'));
      Dbms_Output.Put_Line('city->' || Pljson_Ext.Get_String(Pljson(List_Value.Get(i)), 'city'));
      Dbms_Output.Put_Line('state->' || Pljson_Ext.Get_String(Pljson(List_Value.Get(i)), 'state'));
      Dbms_Output.Put_Line('-------------------------------------------------');
   END LOOP;

END;

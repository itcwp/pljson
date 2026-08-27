DECLARE
   Obj Pljson := Pljson('{
  "id" : 494,
  "group_id" : 1,
  "default_billing" : "381",
  "default_shipping" : "381",
  "created_at" : "2025-01-20 12:32:31",
  "updated_at" : "2025-04-01 12:52:37",
  "created_in" : "Serenova",
  "email" : "mattc+ambasador@tomandco.co.uk",
  "firstname" : "mati",
  "lastname" : "mati",
  "prefix" : "Mr",
  "gender" : 0,
  "store_id" : 1,
  "website_id" : 1,
  "addresses" : [{
    "id" : 144,
    "customer_id" : 494,
    "region" : {
      "region_code" : null,
      "region" : null,
      "region_id" : 0
    },
    "region_id" : 0,
    "country_id" : "GB",
    "street" : ["Flat 103 Stanmore road"],
    "telephone" : "+44700123456",
    "postcode" : "W1 5SR",
    "city" : "London",
    "firstname" : "John",
    "lastname" : "Smith"
  }, {
    "id" : 145,
    "customer_id" : 494,
    "region" : {
      "region_code" : null,
      "region" : null,
      "region_id" : 0
    },
    "region_id" : 0,
    "country_id" : "GB",
    "street" : ["London Kebabeteria, 2 Nelson Road Central"],
    "telephone" : "+44700123456",
    "postcode" : "E1 0AP",
    "city" : "London",
    "firstname" : "mati",
    "lastname" : "mati"
  }, {
    "id" : 381,
    "customer_id" : 494,
    "region" : {
      "region_code" : null,
      "region" : null,
      "region_id" : 0
    },
    "region_id" : 0,
    "country_id" : "GB",
    "street" : ["Tom & Co, 59 Lafone Street"],
    "telephone" : "07703999888",
    "postcode" : "EC1V 1NR",
    "city" : "London",
    "firstname" : "mati",
    "lastname" : "mati",
    "default_shipping" : true,
    "default_billing" : true
  }, {
    "id" : 702,
    "customer_id" : 494,
    "region" : {
      "region_code" : null,
      "region" : null,
      "region_id" : 0
    },
    "region_id" : 0,
    "country_id" : "GB",
    "street" : ["London Kebabeteria, 2 Nelson Road Central"],
    "telephone" : "234234234234",
    "postcode" : "E1 0AP",
    "city" : "London",
    "firstname" : "mati",
    "lastname" : "mati"
  }, {
    "id" : 705,
    "customer_id" : 494,
    "region" : {
      "region_code" : null,
      "region" : null,
      "region_id" : 0
    },
    "region_id" : 0,
    "country_id" : "GB",
    "street" : ["London Kebabeteria, 2 Nelson Road Central"],
    "telephone" : "234234234234",
    "postcode" : "E1 0AP",
    "city" : "London",
    "firstname" : "mati",
    "lastname" : "mati"
  }],
  "disable_auto_group_change" : 0,
  "extension_attributes" : {
    "is_subscribed" : false
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
} ');

   Addresses_List Pljson_List;
   Street_List    Pljson_List;
   Region_List    Pljson_List;
   Test1          Pljson;

BEGIN

   -- Addresses_List := Pljson_List(Obj.Get('addresses'));
   Addresses_List := Pljson_Ext.Get_Json_List(Obj, 'addresses');

   FOR i IN 1 .. Addresses_List.Count
   LOOP
      Dbms_Output.Put_Line('count = ' || i);
   
      Dbms_Output.Put_Line('id->' || Pljson_Ext.Get_Number(Pljson(Addresses_List.Get(i)), 'id'));
      Dbms_Output.Put_Line('country_id->' || Pljson_Ext.Get_String(Pljson(Addresses_List.Get(i)), 'country_id'));
   
      Dbms_Output.Put_Line('-------------------------------------------------');
   
      Dbms_Output.Put_Line('addresses[i].street[1] = ' || Pljson_Ext.Get_String(Obj, 'addresses[' || i || '].street[1]') || '    -> read the first ARRAY. then the second ARRAY (there is only one value in this array)');
   
   --       Street_List := Pljson_Ext.Get_Json_List(Pljson(Addresses_List.Get(i)), 'street');
   --       FOR j IN 1 .. Street_List.Count
   --       LOOP
   --          Dbms_Output.Put_Line('street_list = ' || Street_List.Get(j).To_Char); --This is the json list
   --          Street_List.Get(j).Print;
   --          Dbms_Output.Put_Line('i = ' || i || '    j = ' || j);         
   --       END LOOP;
   
   
   END LOOP;


   Dbms_Output.Put_Line(Chr(13) || '**************************************************' || Chr(13));


   FOR i IN 1 .. Addresses_List.Count
   LOOP
      Dbms_Output.Put_Line('count = ' || i);
   
      Dbms_Output.Put_Line('addresses[i].region.region_code = ' || Pljson_Ext.Get_String(Obj, 'addresses[' || i || '].region.region_code') || '    -> read the ARRAY. then the LIST. then the value of the given key');
      Dbms_Output.Put_Line('addresses[i].region.region = ' || Pljson_Ext.Get_String(Obj, 'addresses[' || i || '].region.region'));
      Dbms_Output.Put_Line('addresses[i].region.region_id = ' || Pljson_Ext.Get_Number(Obj, 'addresses[' || i || '].region.region_id'));
      Dbms_Output.Put_Line('addresses[i].region_id = ' || Pljson_Ext.Get_Number(Obj, 'addresses[' || i || '].region_id') || '    -> This is a Value within the ARRAY');
   
      -- Dbms_Output.Put_Line('region_id as Addresses Level = ' || Pljson(Addresses_List.Get(i)).Get('region_id').To_Char); --not the want we want
      --       Pljson(Addresses_List.Get(i)).Get('region').Print; --This is what we want
      --    
      --       Street_List := Pljson_Ext.Get_Json_List(Pljson(Addresses_List.Get(i)), 'region'); --Region is not a list, it's an Array and so return null
      --    
      --       Dbms_Output.Put_Line(Pljson(Addresses_List.Get(i)).Get('region').To_Char);
      --    
      --       Addresses_List.Get(i).Print;
   
      Dbms_Output.Put_Line('-------------------------------------------------');
   
   END LOOP;

END;

Update Material_amount
set amount=DBMS_RANDOM.value(25,60)
where material_id=1;

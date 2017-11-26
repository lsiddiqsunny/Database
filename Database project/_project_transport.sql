INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (1,'6538178-8',10,8);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (2,'17057655-1',4,4);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (3,'49532371-4',5,6);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (4,'25816118-1',11,5);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (5,'25282974-1',12,10);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (6,'28214252-K',5,13);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (7,'42483126-3',8,12);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (8,'12318048-8',14,9);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (9,'46455196-4',6,1);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (10,'35340483-0',4,6);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (11,'9947189-1',13,8);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (12,'28899286-K',4,4);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (13,'12113968-5',12,4);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (14,'40493933-5',11,11);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (15,'29328310-9',11,5);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (16,'19909265-0',12,10);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (17,'27686340-1',10,4);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (18,'12552493-1',14,10);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (19,'6438767-7',13,15);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (20,'29219287-8',15,3);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (21,'9122314-7',10,15);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (22,'16734390-2',7,7);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (23,'45369141-1',5,2);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (24,'13754232-3',6,12);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (25,'21933513-K',12,4);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (26,'48086350-K',9,10);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (27,'24334663-0',9,14);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (28,'18838614-8',6,8);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (29,'26368430-3',11,3);
INSERT INTO Transport (Transport_id,License,Weight_capacity,Driver_id) VALUES (30,'21012954-5',14,9);

Update Transport
Set Branch_id=Transport_id
Where Transport_id<16;
Update Transport
Set Branch_id=Transport_id-15
Where Transport_id>15;

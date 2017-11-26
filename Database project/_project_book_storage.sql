INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (1,3831,47,229);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (2,8729,71,222);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (3,7311,32,222);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (4,3409,6,248);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (5,6598,65,244);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (6,3384,42,241);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (7,5729,94,240);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (8,1671,24,225);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (9,3403,88,228);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (10,9056,80,230);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (11,3822,6,245);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (12,1765,35,224);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (13,9757,100,225);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (14,2604,14,244);
INSERT INTO Book_storage (Storage_id,Book_capacity,Location_id,Employee_id) VALUES (15,6524,50,232);
Update Book_storage
Set Employee_id=storage_id+210;

--Report listings screen
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('5.CustomReports',5, 'Custom Reports Form');
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('55.CustomReports.Q',55 ,'Custom Reports Form Query Action');
COMMIT;

--Report scheduler screen
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('5.CustomScheduler',5, 'Custom Reports scheduler configuration Form');
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('55.CustomScheduler.I',55 ,'Custom Reports scheduler configuration Form Insert Action');
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('55.CustomScheduler.U',55 ,'Custom Reports scheduler configuration Form Update Action');
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('55.CustomScheduler.Q',55 ,'Custom Reports scheduler configuration Form Query Action');
INSERT INTO ENT_OBJECT (ENT_OBJECT_ID, ENT_CLASS_ID, ENT_OBJECT_DESC)VALUES ('55.CustomScheduler.D',55 ,'Custom Reports scheduler configuration Form Delete Action');
COMMIT;
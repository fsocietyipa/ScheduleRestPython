CREATE TABLE IF NOT EXISTS bundles (
  id VARCHAR(4) NULL,
  bundle_name TEXT NULL
);

INSERT INTO bundles VALUES('281', '700');
INSERT INTO bundles VALUES('285', '210');
INSERT INTO bundles VALUES('290', '307');
INSERT INTO bundles VALUES('293', '404');
INSERT INTO bundles VALUES('294', '405');
INSERT INTO bundles VALUES('295', '406');
INSERT INTO bundles VALUES('304', '605');
INSERT INTO bundles VALUES('305', '606');
INSERT INTO bundles VALUES('309', '703');
INSERT INTO bundles VALUES('312', '706');
INSERT INTO bundles VALUES('320', '608');
INSERT INTO bundles VALUES('321', '708');
INSERT INTO bundles VALUES('322', '902');
INSERT INTO bundles VALUES('348', 'Спортзал');
INSERT INTO bundles VALUES('354', '103б');
INSERT INTO bundles VALUES('356', '216б');
INSERT INTO bundles VALUES('391', '901');
INSERT INTO bundles VALUES('392', '903');
INSERT INTO bundles VALUES('394', '611');
INSERT INTO bundles VALUES('409', '609');





CREATE TABLE IF NOT EXISTS subject_types (
  id VARCHAR(1) NULL,
  subject_type_name TEXT NULL
);

INSERT INTO subject_types VALUES('1', 'lecture');
INSERT INTO subject_types VALUES('2', 'practice');
INSERT INTO subject_types VALUES('3', 'lab');






CREATE TABLE IF NOT EXISTS subjects (
  id VARCHAR(4) NULL,
  subject_name TEXT NULL
);

INSERT INTO subjects VALUES('2784', 'Discrete Mathematics');
INSERT INTO subjects VALUES('2785', 'Discrete Mathematics');
INSERT INTO subjects VALUES('2844', 'Basic Circuit Theory');
INSERT INTO subjects VALUES('2846', 'Physics');
INSERT INTO subjects VALUES('2926', 'Designing applications in Python');
INSERT INTO subjects VALUES('2927', 'Designing databases. Introduction to SQL (c.w.)');
INSERT INTO subjects VALUES('2965', 'Fundamentals of Management and Marketing"');
INSERT INTO subjects VALUES('2967', 'Legal aspects of computer science');
INSERT INTO subjects VALUES('2968', 'Fundamentals of Finance and Accounting');
INSERT INTO subjects VALUES('2992', 'Physical Culture');
INSERT INTO subjects VALUES('3028', 'Global Policy and Information Security');
INSERT INTO subjects VALUES('3029', 'Green Technologies in IT');
INSERT INTO subjects VALUES('3030', 'Communication Technologies');
INSERT INTO subjects VALUES('3031', 'Sociology and Research Methods');
INSERT INTO subjects VALUES('3068', 'Russian');
INSERT INTO subjects VALUES('3079', 'Foreign language');






CREATE TABLE IF NOT EXISTS teachers (
  id VARCHAR(4) NULL,
  teacher_name TEXT NULL
);

INSERT INTO teachers VALUES('685', 'Kulpeshov B.S.');
INSERT INTO teachers VALUES('737', 'Ipalakova M.T.');
INSERT INTO teachers VALUES('748', 'Omarbekova A.O.');
INSERT INTO teachers VALUES('768', 'Alshynov S.K.');
INSERT INTO teachers VALUES('771', 'Shapiyeva A.Y.');
INSERT INTO teachers VALUES('822', 'Kabatayeva R.S.');
INSERT INTO teachers VALUES('834', 'Maulenov K.S.');
INSERT INTO teachers VALUES('836', 'Omarova A.S.');
INSERT INTO teachers VALUES('839', 'Kobadilov B.N.');
INSERT INTO teachers VALUES('870', 'Вакансия ф.1.');
INSERT INTO teachers VALUES('876', 'Kydyrbekuly D.B.');
INSERT INTO teachers VALUES('878', 'Nurmuhanbetova G.A.');
INSERT INTO teachers VALUES('879', 'Tokarczuk P.N.');
INSERT INTO teachers VALUES('884', 'William A..');
INSERT INTO teachers VALUES('914', '1');
INSERT INTO teachers VALUES('920', '3');
INSERT INTO teachers VALUES('959', 'Razakhbergenov A. B.');









CREATE TABLE IF NOT EXISTS times (
id VARCHAR(10) NULL,
"1" VARCHAR(8) NULL,
"2" VARCHAR(8) NULL,
"3" VARCHAR(8) NULL,
"4" VARCHAR(8) NULL,
"5" VARCHAR(8) NULL,
"6" VARCHAR(8) NULL,
"7" VARCHAR(8) NULL,
"8" VARCHAR(8) NULL,
"9" VARCHAR(8) NULL,
"10" VARCHAR(8) NULL,
"11" VARCHAR(8) NULL,
"12" VARCHAR(8) NULL
);

INSERT INTO times VALUES('start_time', '08:00:00', '09:00:00', '10:00:00', '11:00:00', '12:10:00', '13:10:00', '14:10:00', '15:10:00', '16:10:00', '17:20:00', '18:30:00', '19:30:00');

INSERT INTO times VALUES('end_time', '08:50:00', '09:50:00', '10:50:00', '11:50:00', '13:00:00', '14:00:00', '15:00:00', '16:00:00', '17:00:00', '18:10:00', '19:20:00', '20:20:00');












CREATE TABLE IF NOT EXISTS timetables (
  day_id VARCHAR(4) NULL,
  time_id VARCHAR(4) NULL,
  id VARCHAR(5) NULL,
  subject_id VARCHAR(5) NULL,
  subject_type_id VARCHAR(5) NULL,
  teacher_id VARCHAR(5) NULL,
  bundle_id VARCHAR(5) NULL
);

INSERT INTO timetables VALUES('1', '7', '6992', '2785', '1', '685', '281');
INSERT INTO timetables VALUES('1', '8', '715', '2927', '1', '737', '281');
INSERT INTO timetables VALUES('1', '9', '441', '3079', '2', '914', '354');
INSERT INTO timetables VALUES('1', '10', '442', '3079', '2', '914', '354');
INSERT INTO timetables VALUES('1', '11', '6042', '2846', '3', '822', '285');
INSERT INTO timetables VALUES('1', '12', '6043', '2846', '3', '822', '285');


INSERT INTO timetables VALUES('2', '3', '4011', '2967', '1', '834', '391');
INSERT INTO timetables VALUES('2', '4', '4016', '2967', '2', '834', '305');
INSERT INTO timetables VALUES('2', '7', '716', '2926', '1', '768', '281');
INSERT INTO timetables VALUES('2', '8', '717', '2844', '1', '748', '281');
INSERT INTO timetables VALUES('2', '9', '5870', '2846', '1', '771', '281');


INSERT INTO timetables VALUES('3', '7', '163', '2992', '2', '870', '348');
INSERT INTO timetables VALUES('3', '8', '167', '2992', '2', '870', '348');
INSERT INTO timetables VALUES('3', '9', '736', '2784', '2', '685', '321');


INSERT INTO timetables VALUES('4', '6', '7263', '2926', '2', '959', '409');
INSERT INTO timetables VALUES('4', '7', '132', '3068', '2', '920', '356');
INSERT INTO timetables VALUES('4', '8', '133', '3068', '2', '920', '356');
INSERT INTO timetables VALUES('4', '9', '738', '2927', '3', '737', '290');
INSERT INTO timetables VALUES('4', '10', '739', '2927', '3', '737', '290');


INSERT INTO timetables VALUES('5', '8', '751', '2846', '2', '822', '322');
INSERT INTO timetables VALUES('5', '9', '5863', '2926', '3', '959', '290');
INSERT INTO timetables VALUES('5', '10', '5864', '2926', '3', '959', '290');


INSERT INTO timetables VALUES('6', '1', '7222', '3029', '1', '878', '304');
INSERT INTO timetables VALUES('6', '2', '3975', '2965', '2', '836', '293');
INSERT INTO timetables VALUES('6', '3', '745', '2927', '2', '737', '295');
INSERT INTO timetables VALUES('6', '4', '1225', '2844', '3', '748', '294');
INSERT INTO timetables VALUES('6', '5', '1226', '2844', '3', '748', '294');

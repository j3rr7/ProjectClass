DROP TABLE JABATAN CASCADE CONSTRAINTS PURGE;
DROP TABLE PEGAWAI CASCADE CONSTRAINTS PURGE;
DROP TABLE LOG_PENGGAJIAN CASCADE CONSTRAINTS PURGE;
DROP TABLE KATEGORI_MENU CASCADE CONSTRAINTS PURGE;
DROP TABLE MENU CASCADE CONSTRAINTS PURGE;
DROP TABLE PAKET CASCADE CONSTRAINTS PURGE;
DROP TABLE ITEM_PAKET CASCADE CONSTRAINTS PURGE;
DROP TABLE MEMBERSHIP CASCADE CONSTRAINTS PURGE;
DROP TABLE MEMBER CASCADE CONSTRAINTS PURGE;
DROP TABLE EVENT_POTONGAN CASCADE CONSTRAINTS PURGE;
DROP TABLE HJUAL CASCADE CONSTRAINTS PURGE;
DROP TABLE DJUAL CASCADE CONSTRAINTS PURGE;
DROP TABLE BAHAN CASCADE CONSTRAINTS PURGE;
DROP TABLE RESEP CASCADE CONSTRAINTS PURGE;

CREATE TABLE jabatan (
  id_jabatan varchar2(5) PRIMARY KEY,
  jenis_jabatan varchar2(13) NOT NULL,
  gaji_pokok number NOT NULL
);

CREATE TABLE pegawai (
  id_pegawai VARCHAR2(6) PRIMARY KEY,
  --nama_pegawai VARCHAR2(128) NOT NULL,
  nama_pegawai VARCHAR2(20) NOT NULL,
  gender_pegawai VARCHAR2(1) NOT NULL,
  --tempat_lahir VARCHAR2(64) NOT NULL,
  tempat_lahir VARCHAR2(16) NOT NULL,
  tanggal_lahir date NOT NULL,
  tanggal_masuk date NOT NULL,
  persentase_bonus NUMBER NOT NULL,
  id_jabatan VARCHAR2(5) REFERENCES jabatan(id_jabatan) NOT NULL,
  id_manager VARCHAR2(6) REFERENCES pegawai(id_pegawai) NULL
);

CREATE TABLE log_penggajian (
  id_log_penggajian VARCHAR2(10) PRIMARY KEY,
  jumlah NUMBER NOT NULL,
  jenis_transaksi VARCHAR2(32) NOT NULL,
  tanggal_penggajian DATE NOT NULL,
  id_pegawai VARCHAR2(6) REFERENCES pegawai(id_pegawai) NOT NULL
);

CREATE TABLE kategori_menu (
  id_kategori VARCHAR2(5) PRIMARY KEY,
  nama_kategori VARCHAR2(16) NOT NULL
);

CREATE TABLE menu (
  id_menu VARCHAR2(5) PRIMARY KEY,
  --nama_menu VARCHAR2(64) NOT NULL,
  nama_menu VARCHAR2(28) NOT NULL,
  harga_jual NUMBER NOT NULL,
  id_kategori VARCHAR2(5) REFERENCES kategori_menu(id_kategori) NOT NULL
);

CREATE TABLE paket (
  id_paket VARCHAR2(5) PRIMARY KEY,
  --nama_paket VARCHAR2(64) NOT NULL,
  nama_paket VARCHAR2(16) NOT NULL,
  harga_paket NUMBER NOT NULL
);

CREATE TABLE item_paket (
  id_paket VARCHAR2(5) REFERENCES paket(id_paket) NOT NULL,
  id_menu VARCHAR2(5) REFERENCES menu(id_menu) NOT NULL,
  jumlah NUMBER NOT NULL
);

CREATE TABLE membership (
  id_membership VARCHAR2(5) PRIMARY KEY,
  jenis_membership VARCHAR2(32) NOT NULL,
  persentase_diskon NUMBER NOT NULL
);

CREATE TABLE member (
  id_member VARCHAR2(6) PRIMARY KEY,
  --nama_member VARCHAR2(128) NOT NULL,
  nama_member VARCHAR2(20) NOT NULL,
  tanggal_join DATE NOT NULL,
  --alamat VARCHAR2(64) NOT NULL,
  alamat VARCHAR2(30) NOT NULL,
  no_hp VARCHAR2(12) NULL,
  --email VARCHAR2(128) NULL,
  email VARCHAR2(30) NULL,
  id_membership VARCHAR2(5) REFERENCES membership(id_membership) NOT NULL
);

CREATE TABLE event_potongan (
  id_event VARCHAR2(10) PRIMARY KEY,
  nama_event VARCHAR2(20) NOT NULL,
  transaksi_minimum NUMBER NOT NULL,
  jumlah_potongan NUMBER NOT NULL,
  tgl_start_event DATE NOT NULL,
  tgl_end_event DATE NOT NULL
);

CREATE TABLE hjual (
  id_nota VARCHAR2(10) PRIMARY KEY,
  total_kotor NUMBER NOT NULL,
  total_potongan NUMBER NOT NULL,
  total_bersih NUMBER NOT NULL,
  tanggal_transaksi DATE NOT NULL,
  id_member VARCHAR2(6) REFERENCES member(id_member) NULL,
  id_pegawai VARCHAR2(6) REFERENCES pegawai(id_pegawai) NOT NULL,
  id_event VARCHAR2(10) REFERENCES event_potongan(id_event) NULL
);

CREATE TABLE djual (
  id_nota VARCHAR2(10) REFERENCES hjual(id_nota) NOT NULL,
  id_menu VARCHAR2(5) REFERENCES menu(id_menu) NULL,
  id_paket VARCHAR2(5) REFERENCES paket(id_paket) NULL,
  harga NUMBER NOT NULL,
  jumlah NUMBER NOT NULL,
  subtotal NUMBER NOT NULL
);

CREATE TABLE bahan (
  id_bahan VARCHAR2(5) PRIMARY KEY,
  --nama_bahan VARCHAR2(32) NOT NULL,
  nama_bahan VARCHAR2(20) NOT NULL,
  harga_bahan NUMBER NOT NULL,
  stok_bahan NUMBER NOT NULL,
  satuan VARCHAR2(8) NOT NULL
);

CREATE TABLE resep (
  id_menu VARCHAR2(5) REFERENCES menu(id_menu) NOT NULL,
  id_bahan VARCHAR2(5) REFERENCES bahan(id_bahan) NOT NULL,
  jumlah NUMBER NOT NULL
);

--Jabatan
INSERT INTO jabatan(id_jabatan, jenis_jabatan, gaji_pokok) VALUES ('J001','Waitress',3400000);
INSERT INTO jabatan(id_jabatan, jenis_jabatan, gaji_pokok) VALUES ('J002','Cashier',3500000);
INSERT INTO jabatan(id_jabatan, jenis_jabatan, gaji_pokok) VALUES ('J003','Chef',5500000);
INSERT INTO jabatan(id_jabatan, jenis_jabatan, gaji_pokok) VALUES ('J004','Manager',8200000);

--Pegawai
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PCV002','Charlotte Victoria','P','London',to_date('18/04/1995','DD/MM/YYYY'),to_date('12/12/2014','DD/MM/YYYY'),25,'J004',null);
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PVB001','Valencia Beverly','P','Amsterdam',to_date('18/12/1994','DD/MM/YYYY'),to_date('07/05/2018','DD/MM/YYYY'),20,'J004',null);
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PAB001','Annabelle Brooke','P','Surabaya',to_date('18/01/1996','DD/MM/YYYY'),to_date('06/08/2018','DD/MM/YYYY'),10,'J002','PCV002');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PBC001','Bryan Carter','L','Jakarta',to_date('24/06/1994','DD/MM/YYYY'),to_date('15/02/2016','DD/MM/YYYY'),25,'J002','PCV002');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PCV001','Carmellia Vivian','P','Semarang',to_date('31/08/1992','DD/MM/YYYY'),to_date('17/04/2017','DD/MM/YYYY'),15,'J001','PCV002');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PAS001','Alice Sophia','P','Singapura',to_date('02/10/1996','DD/MM/YYYY'),to_date('17/03/2017','DD/MM/YYYY'),15,'J003','PVB001');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PDE001','Dylan Emmanuel','L','Surabaya',to_date('01/05/1994','DD/MM/YYYY'),to_date('27/10/2016','DD/MM/YYYY'),25,'J001','PCV002');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PEV001','Ellie Verine','P','Bandung',to_date('14/03/1996','DD/MM/YYYY'),to_date('15/03/2016','DD/MM/YYYY'),5,'J001','PVB001');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PFC001','Franky Christian','L','Medan',to_date('13/12/1991','DD/MM/YYYY'),to_date('25/02/2017','DD/MM/YYYY'),5,'J001','PVB001');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PAB002','Anastasia Beatrice','P','Surabaya',to_date('27/06/1990','DD/MM/YYYY'),to_date('24/01/2016','DD/MM/YYYY'),20,'J001','PCV002');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PGL001','Garry Lewis','L','Malang',to_date('23/10/1993','DD/MM/YYYY'),to_date('15/09/2016','DD/MM/YYYY'),25,'J001','PVB001');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PHV001','Hannah Violet','P','Surabaya',to_date('05/09/1994','DD/MM/YYYY'),to_date('28/06/2017','DD/MM/YYYY'),5,'J003','PCV002');
INSERT INTO pegawai(id_pegawai, nama_pegawai, gender_pegawai, tempat_lahir, tanggal_lahir, tanggal_masuk, persentase_bonus, id_jabatan, id_manager) VALUES ('PCL001','Carl Landon','L','Jakarta',to_date('09/04/1990','DD/MM/YYYY'),to_date('05/02/2016','DD/MM/YYYY'),10,'J003','PCV002');

--Log Penggajian
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L181216001',3570000,'Tunai',to_date('18/12/2016','DD/MM/YYYY'),'PEV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L301216001',3910000,'Tunai',to_date('30/12/2016','DD/MM/YYYY'),'PCV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L210217001',5775000,'Transfer',to_date('21/02/2017','DD/MM/YYYY'),'PHV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L110317001',3570000,'Transfer',to_date('11/03/2017','DD/MM/YYYY'),'PEV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L190317001',3910000,'Transfer',to_date('19/03/2017','DD/MM/YYYY'),'PCV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L250317001',3570000,'Transfer',to_date('25/03/2017','DD/MM/YYYY'),'PEV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L070417001',9840000,'Transfer',to_date('07/04/2017','DD/MM/YYYY'),'PVB001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L130417001',9840000,'Transfer',to_date('13/04/2017','DD/MM/YYYY'),'PVB001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L150417001',4250000,'Tunai',to_date('15/04/2017','DD/MM/YYYY'),'PGL001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L150517001',5775000,'Tunai',to_date('15/05/2017','DD/MM/YYYY'),'PHV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L250617001',4250000,'Transfer',to_date('25/06/2017','DD/MM/YYYY'),'PDE001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L090817001',4250000,'Tunai',to_date('09/08/2017','DD/MM/YYYY'),'PDE001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L110917001',6050000,'Transfer',to_date('11/09/2017','DD/MM/YYYY'),'PCL001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L250917001',5775000,'Transfer',to_date('25/09/2017','DD/MM/YYYY'),'PHV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L291017001',4080000,'Transfer',to_date('29/10/2017','DD/MM/YYYY'),'PAB002');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L121117001',3570000,'Tunai',to_date('12/11/2017','DD/MM/YYYY'),'PEV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L110118001',3570000,'Transfer',to_date('11/01/2018','DD/MM/YYYY'),'PFC001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L150118001',4375000,'Tunai',to_date('15/01/2018','DD/MM/YYYY'),'PBC001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L080218001',4250000,'Transfer',to_date('08/02/2018','DD/MM/YYYY'),'PGL001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L180218001',9840000,'Tunai',to_date('18/02/2018','DD/MM/YYYY'),'PVB001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L030618001',3570000,'Tunai',to_date('03/06/2018','DD/MM/YYYY'),'PEV001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L040618001',4250000,'Tunai',to_date('04/06/2018','DD/MM/YYYY'),'PDE001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L050618001',4375000,'Tunai',to_date('05/06/2018','DD/MM/YYYY'),'PBC001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L230618001',4080000,'Transfer',to_date('23/06/2018','DD/MM/YYYY'),'PAB002');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L030918001',3850000,'Tunai',to_date('03/09/2018','DD/MM/YYYY'),'PAB001');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L071018001',4080000,'Tunai',to_date('07/10/2018','DD/MM/YYYY'),'PAB002');
INSERT INTO log_penggajian(id_log_penggajian, jumlah, jenis_transaksi, tanggal_penggajian, id_pegawai) VALUES ('L091018001',10250000,'Transfer',to_date('09/10/2018','DD/MM/YYYY'),'PCV002');

--Kategori Menu
INSERT INTO kategori_menu(id_kategori, nama_kategori) VALUES ('KA001','Main course');
INSERT INTO kategori_menu(id_kategori, nama_kategori) VALUES ('KA002','Burger');
INSERT INTO kategori_menu(id_kategori, nama_kategori) VALUES ('KA003','Beverage');
INSERT INTO kategori_menu(id_kategori, nama_kategori) VALUES ('KA004','Ice cream');
INSERT INTO kategori_menu(id_kategori, nama_kategori) VALUES ('KA005','Snack');
INSERT INTO kategori_menu(id_kategori, nama_kategori) VALUES ('KA006','Other');

--Menu
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME001','Crispy chicken',20000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME002','Grilled chicken',20000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME003','Cheese burger',18000,'KA002');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME004','Double cheese burger',28000,'KA002');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME005','Chicken burger',15000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME006','Beef burger',21000,'KA002');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME007','Mini burger',12000,'KA002');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME008','Spaghetti carbonara',21000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME009','Spaghetti bolognese',21000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME010','Small french fries',15000,'KA005');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME011','Big french fries',25000,'KA005');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME012','Chicken soup',12000,'KA006');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME013','Mineral water',5000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME014','Lemon tea',7000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME015','Normal Sprite',8000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME016','Jumbo Sprite',12000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME017','Normal Coca-Cola',8000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME018','Jumbo Coca-Cola',12000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME019','Normal Fanta',8000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME020','Jumbo Fanta',12000,'KA003');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME021','Ice cream sundae',14000,'KA004');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME022','Vanilla ice cream cone',8000,'KA004');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME023','Chocolate ice cream cone',9000,'KA004');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME024','Nasi putih',10000,'KA006');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME025','Pepperoni pizza',60000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME026','Super supreme pizza',65000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME027','Hot Dog',19000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME028','1 Meter Pizza',120000,'KA001');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME029','Egg muffin',14000,'KA002');
INSERT INTO menu(id_menu, nama_menu, harga_jual, id_kategori) VALUES ('ME030','Garlic bread',30000,'KA005');

--Paket
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA001','Super puas',52000);
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA002','Happy family',160000);
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA003','Snack time',43000);
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA004','Super hot deal',70000);
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA005','Diet',26000);
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA006','Couple kenyang',149000);
INSERT INTO paket(id_paket, nama_paket, harga_paket) VALUES ('PA007','Value Set',95000);

--Item Paket
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA001','ME001',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA001','ME017',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA001','ME024',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA002','ME001',5);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA002','ME014',5);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA002','ME024',5);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA003','ME011',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA003','ME017',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA003','ME021',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA004','ME009',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA004','ME010',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA004','ME015',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA004','ME022',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA005','ME007',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA005','ME012',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA005','ME013',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA006','ME001',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA006','ME002',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA006','ME004',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA006','ME011',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA006','ME016',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA006','ME018',1);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA007','ME002',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA007','ME007',3);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA007','ME013',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA007','ME022',2);
INSERT INTO item_paket(id_paket, id_menu, jumlah) VALUES ('PA007','ME024',1);

--Membership
INSERT INTO membership(id_membership, jenis_membership, persentase_diskon) VALUES ('MS001','White',10);
INSERT INTO membership(id_membership, jenis_membership, persentase_diskon) VALUES ('MS002','Silver',15);
INSERT INTO membership(id_membership, jenis_membership, persentase_diskon) VALUES ('MS003','Gold',20);
INSERT INTO membership(id_membership, jenis_membership, persentase_diskon) VALUES ('MS004','Platinum',25);

--Member
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MLA001','Lily Andrew',to_date('17/10/2017','DD/MM/YYYY'),'Jl. Kebalen Timur No. 32','080172270135','lilya@smail.com','MS001');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MAB001','Angelina Brianne',to_date('16/03/2016','DD/MM/YYYY'),'Jl. Cemara No. 838','083872836268','abrianne@xmail.com','MS002');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MEJ001','Ethan John',to_date('25/01/2014','DD/MM/YYYY'),'Jl. Raya Setiabudhi No. 36','083936322448','ethjohn@hmail.com','MS002');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MNS001','Nathalie Sienna',to_date('06/07/2015','DD/MM/YYYY'),'Jl. Merdeka No. 711','080749279530','siennanath@cmail.com','MS002');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MSI001','Scarlett Isla',to_date('24/12/2015','DD/MM/YYYY'),'Jl. Suniaraja No. 682','080802063814','scarlett@xmail.com','MS001');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MVS001','Veanne Sophia',to_date('22/10/2018','DD/MM/YYYY'),'Jl. Bara No. 262','085582395644','ve.sophia@hmail.com','MS004');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MLH001','Lucas Harrison',to_date('26/10/2018','DD/MM/YYYY'),'Jl. Mulyadi No. 332','087656293049','lucas.harrison@smail.com','MS004');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MMA001','Matilda Abigail',to_date('22/02/2018','DD/MM/YYYY'),'Jl. Zamrud No. 606','085451752047','matilda.abby@cmail.com','MS004');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MAE001','Alexis Emerson',to_date('20/02/2015','DD/MM/YYYY'),'Jl. Bakhita No. 525','088879213465','alexis.emm@cmail.com','MS001');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MAJ001','Ashley Jools',to_date('22/02/2014','DD/MM/YYYY'),'Jl. Asia Afrika No. 267','088631581774','ash.jo@hmail.com','MS002');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MTT001','Triston Tolly',to_date('27/09/2017','DD/MM/YYYY'),'Jl. Raya Setiabudhi No. 990','080595935766','tri.to@smail.com','MS003');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MHK001','Helge Kilie',to_date('06/08/2015','DD/MM/YYYY'),'Jl. Gajah Mada No. 584','088044626038','helge.killie@hmail.com','MS003');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MKG001','Kayly Gemma',to_date('17/01/2014','DD/MM/YYYY'),'Jl. Basuki Rahmat  No. 623','088436602284','kaylie.gemma@xmail.com','MS003');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MDL001','Doris Lora',to_date('11/06/2014','DD/MM/YYYY'),'Jl. Dahlia No. 63','089296138439','dorralorris@xmail.com','MS002');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MDH001','Dennis Hyrum',to_date('07/07/2015','DD/MM/YYYY'),'Jl. Honggowongso No. 688','084212985166','denn.hy@smail.com','MS003');
INSERT INTO member(id_member, nama_member, tanggal_join, alamat, no_hp, email, id_membership) VALUES ('MKA001','Christina Allycia',to_date('26/03/2018','DD/MM/YYYY'),'Jl. Jagakarsa No. 389','085332974891','christina.alice@hmail.com','MS004');

--Event Potongan
INSERT INTO event_potongan(id_event, nama_event, transaksi_minimum, jumlah_potongan, tgl_start_event, tgl_end_event) VALUES ('E010118001','Blessed New Year',100000,10000,to_date('01/01/2018','DD/MM/YYYY'),to_date('05/01/2018','DD/MM/YYYY'));
INSERT INTO event_potongan(id_event, nama_event, transaksi_minimum, jumlah_potongan, tgl_start_event, tgl_end_event) VALUES ('E200318001','Marchversary',130000,20000,to_date('20/03/2018','DD/MM/YYYY'),to_date('30/03/2018','DD/MM/YYYY'));
INSERT INTO event_potongan(id_event, nama_event, transaksi_minimum, jumlah_potongan, tgl_start_event, tgl_end_event) VALUES ('E170818001','Tujuhbelasan Meriah',170000,17000,to_date('17/08/2018','DD/MM/YYYY'),to_date('20/08/2018','DD/MM/YYYY'));
INSERT INTO event_potongan(id_event, nama_event, transaksi_minimum, jumlah_potongan, tgl_start_event, tgl_end_event) VALUES ('E151218001','Christmas Vibes',85000,10000,to_date('15/12/2018','DD/MM/YYYY'),to_date('31/12/2018','DD/MM/YYYY'));

--HJual
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N130218001',321000,64200,256800,to_date('13/02/2018','DD/MM/YYYY'),'MHK001','PBC001',null);
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N280318001',306000,50600,255400,to_date('28/03/2018','DD/MM/YYYY'),'MSI001','PBC001','E200318001');
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N300318001',204000,20000,184000,to_date('30/03/2018','DD/MM/YYYY'),null,'PAB001','E200318001');
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N030418001',1138000,113800,1024200,to_date('03/04/2018','DD/MM/YYYY'),'MLA001','PAB001',null);
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N180418001',9000,0,9000,to_date('18/04/2018','DD/MM/YYYY'),null,'PBC001',null);
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N180418002',212000,0,212000,to_date('18/04/2018','DD/MM/YYYY'),null,'PBC001',null);
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N260918001',169000,0,169000,to_date('26/09/2018','DD/MM/YYYY'),null,'PAB001',null);
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N211018001',368000,73600,294400,to_date('21/10/2018','DD/MM/YYYY'),'MDH001','PAB001',null);
INSERT INTO hjual(id_nota, total_kotor, total_potongan, total_bersih, tanggal_transaksi, id_member, id_pegawai, id_event) VALUES ('N171218001',645000,74500,570500,to_date('17/12/2018','DD/MM/YYYY'),'MAE001','PAB001','E151218001');

--DJual
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N130218001',null,'PA005',26000,5,130000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N130218001','ME010',null,15000,5,75000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N130218001','ME016',null,12000,1,12000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N130218001',null,'PA001',52000,2,104000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N280318001','ME014',null,7000,2,14000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N280318001',null,'PA001',52000,4,208000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N280318001','ME006',null,21000,4,84000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N300318001','ME012',null,12000,4,48000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N300318001',null,'PA001',52000,3,156000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N030418001',null,'PA006',149000,3,447000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N030418001',null,'PA002',160000,2,320000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N030418001',null,'PA003',43000,5,215000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N030418001',null,'PA001',52000,3,156000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N180418001','ME023',null,9000,1,9000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N180418002','ME004',null,28000,5,140000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N180418002','ME018',null,12000,2,24000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N180418002','ME007',null,12000,4,48000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N260918001','ME024',null,10000,2,20000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N260918001',null,'PA006',149000,1,149000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N211018001','ME011',null,25000,1,25000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N211018001',null,'PA006',149000,1,149000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N211018001',null,'PA005',26000,4,104000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N211018001','ME003',null,18000,5,90000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N171218001','ME028',null,120000,3,360000);
INSERT INTO djual(id_nota, id_menu, id_paket, harga, jumlah, subtotal) VALUES ('N171218001',null,'PA007',95000,3,285000);

--Bahan
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA001','Beras',1500,431,'ons');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA002','Tepung roti',100,84,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA003','Daging ayam',5000,127,'potong');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA004','Daging sapi',7000,210,'porsi');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA005','Keju',100,1432,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA006','Minyak goreng',2000,156,'gelas');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA007','Roti bundar',1000,214,'buah');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA008','Roti tawar',2000,89,'buah');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA009','Adonan pizza',25000,45,'porsi');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA010','Sayur selada',300,60,'lembar');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA011','Wortel',400,62,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA012','Kentang',2000,51,'ons');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA013','Bawang putih',500,123,'siung');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA014','Bawang merah',400,112,'siung');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA015','Bawang bombay',800,456,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA016','Tomat',500,312,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA017','Mayonnaise',200,1200,'ml');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA018','Saus tomat',200,1341,'ml');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA019','Pepperoni',50,678,'potong');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA020','Susu',10,32635,'ml');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA021','Cokelat',40,1354,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA022','Jamur',600,1753,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA023','Telur',2000,150,'butir');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA024','Spaghetti mentah',5000,12,'pack');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA025','Mentega',100,1252,'gram');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA026','Gelas plastik',800,154,'buah');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA027','Cone es krim',100,134,'buah');
INSERT INTO bahan(id_bahan, nama_bahan, harga_bahan, stok_bahan, satuan) VALUES ('BA028','Sosis',4000,125,'buah');

--Resep
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME001','BA002',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME001','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME001','BA006',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME002','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME002','BA013',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME002','BA025',5);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA005',7);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA007',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA010',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA015',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA016',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME003','BA017',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA003',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA005',14);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA007',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA010',4);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA015',4);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA016',6);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME004','BA017',5);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME005','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME005','BA007',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME005','BA010',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME005','BA017',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME005','BA018',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA004',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA007',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA010',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA015',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA016',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA018',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME006','BA022',5);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME007','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME007','BA007',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME007','BA018',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME008','BA004',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME008','BA005',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME008','BA014',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME008','BA018',4);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME008','BA024',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME009','BA004',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME009','BA005',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME009','BA013',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME009','BA020',50);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME009','BA022',5);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME009','BA024',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME010','BA006',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME010','BA012',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME010','BA018',4);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME011','BA006',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME011','BA012',6);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME011','BA018',8);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME012','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME012','BA010',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME012','BA011',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME012','BA012',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME012','BA013',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME021','BA020',200);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME021','BA021',20);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME021','BA026',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME022','BA020',200);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME022','BA027',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME023','BA020',200);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME023','BA021',10);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME023','BA027',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME024','BA001',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME025','BA004',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME025','BA005',18);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME025','BA009',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME025','BA018',20);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME025','BA019',14);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA004',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA005',18);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA009',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA013',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA018',20);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA019',10);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME026','BA022',12);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME027','BA008',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME027','BA017',10);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME027','BA018',10);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME027','BA028',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME029','BA003',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME029','BA005',10);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME029','BA007',2);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME029','BA023',1);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME030','BA008',4);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME030','BA013',3);
INSERT INTO resep(id_menu, id_bahan, jumlah) VALUES ('ME030','BA025',20);

COMMIT;
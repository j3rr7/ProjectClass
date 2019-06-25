select 'drop table ' ||tname ||' cascade constraint purge;'
from tab;

create table tipe_kamar(
tipe_id varchar2 (5) primary key,
jenis_kamar varchar2 (20),
harga number(10),
max_orang number (5)
);

create table kamar(
no_kamar varchar2(5) primary key,
tipe_id varchar2(5) references tipe_kamar(tipe_id)
);

create table member(
member_id varchar2(5) primary key,
nama varchar2(20) not null,
alamat varchar2(35),
no_telp varchar (15)
);

create table customer(
cust_id varchar2(5) primary key,
nama_cust varchar2(50),
no_telp varchar2(50),
member_id varchar2(5) references member(member_id)
);

create table event(
event_id varchar2(5) primary key,
start_date date,
end_date date,
keterangan varchar2(20),
tipe_id varchar2(5) references tipe_kamar(tipe_id),
harga number(20)
);

create table booking(
book_id varchar2(5) primary key,
tgl_booking date,
cust_id varchar2(5) references customer(cust_id),
tipe_id varchar2(5) references tipe_kamar(tipe_id),
tgl_checkin date,
jum_malam number(2),
harga number(20),
status_pembayaran varchar2(20),
jum_kamar number(2),
max_orang number(3)
);

create table service(
service_id varchar2(5) primary key,
service_name varchar2(20),
harga number (10)
);


create table transaction(
transaction_id varchar2(5) unique,
no_kamar varchar2(5) references kamar(no_kamar),
tgl_checkin date,
checkout_date date,
book_id varchar2(5) references booking(book_id),
total number(20),
constraint pk_transaction primary key(transaction_id,no_kamar)
);

create table transaction_detail(
no_kamar varchar2(5),
jumlah number(5),
harga number(15),
counter number (5),
service_id varchar2(5) references service(service_id),
transaction_id varchar2(5) references transaction(transaction_id),
constraint pk_transaction_detail primary key(counter,no_kamar)
);



insert into tipe_kamar values('TK01','STANDARD',1000000,2);
insert into tipe_kamar values('TK02','DELUXE',1500000,3);
insert into tipe_kamar values('TK03','JUNIOR SUITE',2000000,4);
insert into tipe_kamar values('TK04','SUITE',2400000,5);


insert into kamar values ('101','TK01');
insert into kamar values ('102','TK01');
insert into kamar values ('103','TK01');
insert into kamar values ('104','TK01');
insert into kamar values ('105','TK01');
insert into kamar values ('106','TK01');
insert into kamar values ('107','TK01');
insert into kamar values ('108','TK01');
insert into kamar values ('109','TK01');
insert into kamar values ('110','TK01');
insert into kamar values ('211','TK01');
insert into kamar values ('212','TK01');
insert into kamar values ('213','TK01');
insert into kamar values ('214','TK01');
insert into kamar values ('215','TK01');
insert into kamar values ('216','TK01');
insert into kamar values ('217','TK01');
insert into kamar values ('218','TK01');
insert into kamar values ('219','TK01');
insert into kamar values ('220','TK01');
insert into kamar values ('321','TK01');
insert into kamar values ('322','TK01');
insert into kamar values ('323','TK01');
insert into kamar values ('324','TK01');
insert into kamar values ('325','TK01');
insert into kamar values ('326','TK01');
insert into kamar values ('327','TK01');
insert into kamar values ('328','TK01');
insert into kamar values ('329','TK01');
insert into kamar values ('330','TK01');
insert into kamar values ('431','TK01');
insert into kamar values ('432','TK01');
insert into kamar values ('433','TK01');
insert into kamar values ('434','TK01');
insert into kamar values ('435','TK01');
insert into kamar values ('436','TK01');
insert into kamar values ('437','TK01');
insert into kamar values ('438','TK01');
insert into kamar values ('439','TK01');
insert into kamar values ('440','TK01');
insert into kamar values ('501','TK02');
insert into kamar values ('502','TK02');
insert into kamar values ('503','TK02');
insert into kamar values ('504','TK02');
insert into kamar values ('505','TK02');
insert into kamar values ('506','TK02');
insert into kamar values ('507','TK02');
insert into kamar values ('508','TK02');
insert into kamar values ('509','TK02');
insert into kamar values ('510','TK02');
insert into kamar values ('611','TK02');
insert into kamar values ('612','TK02');
insert into kamar values ('613','TK02');
insert into kamar values ('614','TK02');
insert into kamar values ('615','TK02');
insert into kamar values ('616','TK02');
insert into kamar values ('617','TK02');
insert into kamar values ('618','TK02');
insert into kamar values ('619','TK02');
insert into kamar values ('620','TK02');
insert into kamar values ('721','TK02');
insert into kamar values ('722','TK02');
insert into kamar values ('723','TK02');
insert into kamar values ('724','TK02');
insert into kamar values ('725','TK02');
insert into kamar values ('726','TK02');
insert into kamar values ('727','TK02');
insert into kamar values ('728','TK02');
insert into kamar values ('729','TK02');
insert into kamar values ('730','TK02');
insert into kamar values ('801','TK03');
insert into kamar values ('802','TK03');
insert into kamar values ('803','TK03');
insert into kamar values ('804','TK03');
insert into kamar values ('805','TK03');
insert into kamar values ('806','TK03');
insert into kamar values ('807','TK03');
insert into kamar values ('808','TK03');
insert into kamar values ('809','TK03');
insert into kamar values ('810','TK03');
insert into kamar values ('911','TK03');
insert into kamar values ('912','TK03');
insert into kamar values ('913','TK03');
insert into kamar values ('914','TK03');
insert into kamar values ('915','TK03');
insert into kamar values ('916','TK03');
insert into kamar values ('917','TK03');
insert into kamar values ('918','TK03');
insert into kamar values ('919','TK03');
insert into kamar values ('920','TK03');
insert into kamar values ('1001','TK04');
insert into kamar values ('1002','TK04');
insert into kamar values ('1003','TK04');
insert into kamar values ('1004','TK04');
insert into kamar values ('1005','TK04');
insert into kamar values ('1006','TK04');
insert into kamar values ('1007','TK04');
insert into kamar values ('1008','TK04');
insert into kamar values ('1009','TK04');
insert into kamar values ('1010','TK04');


insert into service values ('S01','Laundry',25000);
insert into service values ('S02','Spa',175000);
insert into service values ('S03','Extra Bed',65000);
insert into service values ('S04','Fried Rice',25000);
insert into service values ('S05','Fried Noodle',30000);
insert into service values ('S06','Beef Steak',60000);
insert into service values ('S07','Omurice',45000);
insert into service values ('S08','Pasta',40000);
insert into service values ('S09','Ikan Salmon',47000);
insert into service values ('S10','Salad',30000);
insert into service values ('S11','Ice Lemon Tea',10000);
insert into service values ('S12','Hot Chocolate',23000);
insert into service values ('S13','Orange Juice',15000);


insert into event values ('E01', to_date('25-12-2019','DD-MM-YYYY'),to_date('05-01-2020','DD-MM-YYYY'),'Natal dan Tahun Baru','TK01',1250000);
insert into event values ('E02', to_date('25-12-2019','DD-MM-YYYY'),to_date('05-01-2020','DD-MM-YYYY'),'Natal dan Tahun Baru','TK02',1375000);
insert into event values ('E03', to_date('25-12-2019','DD-MM-YYYY'),to_date('05-01-2020','DD-MM-YYYY'),'Natal dan Tahun Baru','TK03',2500000);
insert into event values ('E04', to_date('25-12-2019','DD-MM-YYYY'),to_date('05-01-2020','DD-MM-YYYY'),'Natal dan Tahun Baru','TK04',3000000);
insert into event values ('E05', to_date('05-06-2019','DD-MM-YYYY'),to_date('05-07-2020','DD-MM-YYYY'),'Lebaran','TK01',1500000);
insert into event values ('E06', to_date('05-06-2019','DD-MM-YYYY'),to_date('05-07-2020','DD-MM-YYYY'),'Lebaran','TK02',2250000);
insert into event values ('E07', to_date('05-06-2019','DD-MM-YYYY'),to_date('05-07-2020','DD-MM-YYYY'),'Lebaran','TK03',3000000);
insert into event values ('E08', to_date('05-06-2019','DD-MM-YYYY'),to_date('05-07-2020','DD-MM-YYYY'),'Lebaran','TK04',3600000);
insert into event values ('E09', to_date('15-06-2019','DD-MM-YYYY'),to_date('15-07-2020','DD-MM-YYYY'),'Libur Sekolah','TK01',1150000);
insert into event values ('E10', to_date('15-06-2019','DD-MM-YYYY'),to_date('15-07-2020','DD-MM-YYYY'),'Libur Sekolah','TK02',1725000);
insert into event values ('E11', to_date('15-06-2019','DD-MM-YYYY'),to_date('15-07-2020','DD-MM-YYYY'),'Libur Sekolah','TK03',2300000);
insert into event values ('E12', to_date('15-06-2019','DD-MM-YYYY'),to_date('15-07-2020','DD-MM-YYYY'),'Libur Sekolah','TK04',2760000);
insert into event values ('E13', to_date('05-05-2019','DD-MM-YYYY'),to_date('15-05-2020','DD-MM-YYYY'),'Percobaan','TK04',2760000);


insert into member values('M01','Taylor white','Jalan Pahlawan no 12','081234567829');
insert into member values('M02','Glenn thomas','Jalan Panglima Sudirman no 34','081234965849');
insert into member values('M03','Aubrey carter','Jalan Tidar no 100','081234567839');
insert into member values('M04','Jacquelyn hernandee','Jalan Mleto no 89','081234567859');
insert into member values('M05','Leonel nelson','Jalan Nginden no 82','085216005558');
insert into member values('M06','Aubrey robinson','Jalan Ngagel Jaya Tengah no 102','085234005551');
insert into member values('M07','David hall','Jalan Blauran no 122','085955503555');
insert into member values('M08','Miah campbell','Jalan Manyar Kertoarjo no 78','089755507556');
insert into member values('M09','Christopher brown','Jalan Ahmad Yani no 13','085255577668');
insert into member values('M10','Paityn jones','Jalan Dukuh Kupang no 90','081852255955');

insert into customer values('G001','Tyler garcia','085059721347',null);
insert into customer (cust_id,nama_cust,no_telp)values('G002','Andrew robinson','081234567899');
insert into customer (cust_id,no_telp,nama_cust)values('G003','Tabitha miller','081234567819')        ;
insert into customer values('G004','Taylor white','081234567829','M01')                               ;
insert into customer values('G005','Aubrey carter','081234567839','M03')                              ;
insert into customer values('G006','Glenn thomas','081234965849','M02')                               ;
insert into customer values('G007','Jacquelyn hernandez','081234567859','M04')                        ;
insert into customer (cust_id,nama_cust,no_telp)values('G008','Alivia martinez','081234567869')       ;
insert into customer (cust_id,nama_cust,no_telp)values('G009','Amber lopez','081234567879')              ;
insert into customer (cust_id,nama_cust,no_telp)values('G010','Amber baker','081234567889')              ;
insert into customer (cust_id,nama_cust,no_telp)values('G011','Taylor lopez','081234567299')             ;
insert into customer (cust_id,nama_cust,no_telp)values('G012','Noah nelson','081234567199')              ;
insert into customer values('G013','Aubrey robinson','085234005551','M06')          ;
insert into customer (cust_id,nama_cust,no_telp)values('G014','Lauren hall','085243005552')              ;
insert into customer (cust_id,nama_cust,no_telp)values('G015','Ruby hill','085225005553')                ;
insert into customer (cust_id,nama_cust,no_telp)values('G016','Brianna anderson','085281005554')         ;
insert into customer (cust_id,nama_cust,no_telp)values('G017','Finnegan carter','085270005555')          ;
insert into customer (cust_id,nama_cust,no_telp)values('G018','Ethen hill','085212005556')               ;
insert into customer (cust_id,nama_cust,no_telp)values('G019','Anna walker','085290005557')              ;
insert into customer values('G013','Aubrey robinson','085234005551','M06')          ;                                ;
insert into customer (cust_id,nama_cust,no_telp)values('G021','Caden walker','085244005559')             ;
insert into customer (cust_id,nama_cust,no_telp)values('G022','Bryan jackson','085223055510')           ;
insert into customer (cust_id,nama_cust,no_telp)values('G023','Emily baker','085267055511')             ;
insert into customer (cust_id,nama_cust,no_telp)values('G024','Tabitha martinez','085255055512')        ;
insert into customer (cust_id,nama_cust,no_telp)values('G025','Eliana adams','085273055513')            ;
insert into customer (cust_id,nama_cust,no_telp)values('G026','Mateo edwards','087812555539')           ;
insert into customer (cust_id,nama_cust,no_telp)values('G027','Riley young','083855543442')             ;
insert into customer values('G028','David hall','085955503555','M07')              ;
insert into customer (cust_id,nama_cust,no_telp)values('G029','Ryan garcia','085455185260')             ;
insert into customer (cust_id,nama_cust,no_telp)values('G030','Ashley mitchell','087857955736')         ;
insert into customer (cust_id,nama_cust,no_telp)values('G031','Samantha davis','087855550534')          ;
insert into customer values('G032','Christopher brown','085255577668','M09')      ;
insert into customer (cust_id,nama_cust,no_telp)values('G033','Yamilet lee','083855500086')            ;
insert into customer (cust_id,nama_cust,no_telp)values('G034','Saige robinson','089568555107')         ;
insert into customer (cust_id,nama_cust,no_telp)values('G035','Landon wright','087855425364')          ;
insert into customer (cust_id,nama_cust,no_telp)values('G036','Alyssa thompson','087855595053')        ;
insert into customer values('G037','Miah campbell','089755507556','M08')         ;
insert into customer (cust_id,nama_cust,no_telp)values('G038','Leonel smith','083855586211')           ;
insert into customer (cust_id,nama_cust,no_telp)values('G039','Camila mitchell','089755542485')       ;
insert into customer (cust_id,nama_cust,no_telp)values('G040','Holly king','087800555367')             ;
insert into customer (cust_id,nama_cust,no_telp)values('G041','Anna allen','089715552806')             ;
insert into customer (cust_id,nama_cust,no_telp)values('G042','Elizabeth perez','087855554823')        ;
insert into customer values('G043','Paityn jones','081852255955','M10')           ;



insert into booking values('B001',to_date('11-03-2019','DD-MM-YYYY'),'G006','TK02',to_date('12-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B002',to_date('19-03-2019','DD-MM-YYYY'),'G018','TK01',to_date('20-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B003',to_date('21-03-2019','DD-MM-YYYY'),'G022','TK04',to_date('21-03-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',1,5);
insert into booking values('B004',to_date('16-03-2019','DD-MM-YYYY'),'G002','TK01',to_date('19-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',2,2);
insert into booking values('B005',to_date('26-03-2019','DD-MM-YYYY'),'G019','TK02',to_date('30-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B006',to_date('15-03-2019','DD-MM-YYYY'),'G028','TK01',to_date('17-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B007',to_date('12-03-2019','DD-MM-YYYY'),'G040','TK02',to_date('16-03-2019','DD-MM-YYYY'),5,7500000,'sudah dibayar',1,3);
insert into booking values('B008',to_date('15-03-2019','DD-MM-YYYY'),'G026','TK02',to_date('15-03-2019','DD-MM-YYYY'),5,7500000,'sudah dibayar',1,3);
insert into booking values('B009',to_date('23-03-2019','DD-MM-YYYY'),'G030','TK01',to_date('27-03-2019','DD-MM-YYYY'),6,6000000,'sudah dibayar',1,2);
insert into booking values('B010',to_date('09-03-2019','DD-MM-YYYY'),'G003','TK01',to_date('12-03-2019','DD-MM-YYYY'),6,6000000,'sudah dibayar',1,2);
insert into booking values('B011',to_date('24-03-2019','DD-MM-YYYY'),'G009','TK04',to_date('24-03-2019','DD-MM-YYYY'),6,14400000,'sudah dibayar',1,5);
insert into booking values('B012',to_date('12-03-2019','DD-MM-YYYY'),'G024','TK04',to_date('15-03-2019','DD-MM-YYYY'),4,9600000,'sudah dibayar',1,5);
insert into booking values('B013',to_date('27-03-2019','DD-MM-YYYY'),'G019','TK01',to_date('29-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B014',to_date('11-03-2019','DD-MM-YYYY'),'G039','TK02',to_date('11-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B015',to_date('28-03-2019','DD-MM-YYYY'),'G041','TK02',to_date('28-03-2019','DD-MM-YYYY'),6,9000000,'sudah dibayar',4,3);
insert into booking values('B016',to_date('07-03-2019','DD-MM-YYYY'),'G007','TK04',to_date('10-03-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',1,5);
insert into booking values('B017',to_date('31-03-2019','DD-MM-YYYY'),'G023','TK04',to_date('31-03-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',1,5);
insert into booking values('B018',to_date('08-03-2019','DD-MM-YYYY'),'G034','TK04',to_date('10-03-2019','DD-MM-YYYY'),6,14400000,'sudah dibayar',1,5);
insert into booking values('B019',to_date('06-03-2019','DD-MM-YYYY'),'G016','TK04',to_date('07-03-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B020',to_date('23-03-2019','DD-MM-YYYY'),'G027','TK03',to_date('25-03-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B021',to_date('01-03-2019','DD-MM-YYYY'),'G033','TK03',to_date('05-03-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B022',to_date('22-03-2019','DD-MM-YYYY'),'G033','TK04',to_date('26-03-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B023',to_date('15-03-2019','DD-MM-YYYY'),'G010','TK02',to_date('17-03-2019','DD-MM-YYYY'),4,6000000,'sudah dibayar',1,3);
insert into booking values('B024',to_date('16-03-2019','DD-MM-YYYY'),'G021','TK04',to_date('16-03-2019','DD-MM-YYYY'),4,6000000,'sudah dibayar',1,5);
insert into booking values('B025',to_date('28-03-2019','DD-MM-YYYY'),'G032','TK03',to_date('30-03-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B026',to_date('13-03-2019','DD-MM-YYYY'),'G018','TK02',to_date('15-03-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',2,3);
insert into booking values('B027',to_date('09-03-2019','DD-MM-YYYY'),'G031','TK02',to_date('12-03-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B028',to_date('28-03-2019','DD-MM-YYYY'),'G009','TK01',to_date('29-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B029',to_date('26-03-2019','DD-MM-YYYY'),'G014','TK01',to_date('26-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B030',to_date('10-03-2019','DD-MM-YYYY'),'G025','TK03',to_date('11-03-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B031',to_date('28-03-2019','DD-MM-YYYY'),'G026','TK02',to_date('28-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B032',to_date('05-03-2019','DD-MM-YYYY'),'G021','TK04',to_date('07-03-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',1,5);
insert into booking values('B033',to_date('08-03-2019','DD-MM-YYYY'),'G030','TK02',to_date('09-03-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B034',to_date('10-03-2019','DD-MM-YYYY'),'G018','TK01',to_date('11-03-2019','DD-MM-YYYY'),4,4000000,'sudah dibayar',1,2);
insert into booking values('B035',to_date('07-03-2019','DD-MM-YYYY'),'G024','TK02',to_date('07-03-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B036',to_date('09-03-2019','DD-MM-YYYY'),'G019','TK03',to_date('10-03-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B037',to_date('10-03-2019','DD-MM-YYYY'),'G039','TK04',to_date('10-03-2019','DD-MM-YYYY'),5,12000000,'sudah dibayar',1,5);
insert into booking values('B038',to_date('08-03-2019','DD-MM-YYYY'),'G042','TK02',to_date('09-03-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',3,3);
insert into booking values('B039',to_date('19-03-2019','DD-MM-YYYY'),'G037','TK02',to_date('20-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B040',to_date('04-03-2019','DD-MM-YYYY'),'G029','TK03',to_date('08-03-2019','DD-MM-YYYY'),4,8000000,'sudah dibayar',1,4);
insert into booking values('B041',to_date('31-03-2019','DD-MM-YYYY'),'G006','TK03',to_date('31-03-2019','DD-MM-YYYY'),4,8000000,'sudah dibayar',1,4);
insert into booking values('B042',to_date('01-03-2019','DD-MM-YYYY'),'G014','TK02',to_date('05-03-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B043',to_date('27-03-2019','DD-MM-YYYY'),'G028','TK02',to_date('29-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B044',to_date('05-03-2019','DD-MM-YYYY'),'G038','TK04',to_date('05-03-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B045',to_date('12-03-2019','DD-MM-YYYY'),'G031','TK02',to_date('14-03-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B046',to_date('14-03-2019','DD-MM-YYYY'),'G040','TK04',to_date('14-03-2019','DD-MM-YYYY'),4,9600000,'sudah dibayar',1,5);
insert into booking values('B047',to_date('25-03-2019','DD-MM-YYYY'),'G011','TK02',to_date('26-03-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B048',to_date('01-03-2019','DD-MM-YYYY'),'G028','TK04',to_date('04-03-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B049',to_date('03-03-2019','DD-MM-YYYY'),'G042','TK02',to_date('05-03-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3); smpe atas sdh
insert into booking values('B050',to_date('24-03-2019','DD-MM-YYYY'),'G001','TK03',to_date('24-03-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4); //sudah
insert into booking values('B051',to_date('14-03-2019','DD-MM-YYYY'),'G037','TK01',to_date('16-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',2,2); 
insert into booking values('B052',to_date('16-03-2019','DD-MM-YYYY'),'G024','TK04',to_date('20-03-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5); 
insert into booking values('B053',to_date('10-03-2019','DD-MM-YYYY'),'G023','TK04',to_date('11-03-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5); 
insert into booking values('B054',to_date('27-03-2019','DD-MM-YYYY'),'G031','TK04',to_date('27-03-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B055',to_date('02-03-2019','DD-MM-YYYY'),'G032','TK03',to_date('04-03-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B056',to_date('26-03-2019','DD-MM-YYYY'),'G014','TK04',to_date('28-03-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',2,5);
insert into booking values('B057',to_date('27-03-2019','DD-MM-YYYY'),'G007','TK01',to_date('27-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B058',to_date('03-03-2019','DD-MM-YYYY'),'G033','TK01',to_date('05-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B059',to_date('14-03-2019','DD-MM-YYYY'),'G021','TK01',to_date('14-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2); 
insert into booking values('B060',to_date('06-03-2019','DD-MM-YYYY'),'G042','TK01',to_date('13-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B061',to_date('23-03-2019','DD-MM-YYYY'),'G031','TK01',to_date('25-03-2019','DD-MM-YYYY'),4,4000000,'sudah dibayar',1,2);
insert into booking values('B062',to_date('07-03-2019','DD-MM-YYYY'),'G008','TK01',to_date('10-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B063',to_date('10-03-2019','DD-MM-YYYY'),'G030','TK01',to_date('10-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B064',to_date('09-03-2019','DD-MM-YYYY'),'G022','TK01',to_date('10-03-2019','DD-MM-YYYY'),5,5000000,'sudah dibayar',1,2);
insert into booking values('B065',to_date('30-03-2019','DD-MM-YYYY'),'G016','TK01',to_date('31-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B066',to_date('11-03-2019','DD-MM-YYYY'),'G010','TK02',to_date('12-03-2019','DD-MM-YYYY'),4,6000000,'sudah dibayar',1,3);
insert into booking values('B067',to_date('22-03-2019','DD-MM-YYYY'),'G026','TK01',to_date('22-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',2,2);
insert into booking values('B068',to_date('15-03-2019','DD-MM-YYYY'),'G017','TK03',to_date('17-03-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4); 
insert into booking values('B069',to_date('03-03-2019','DD-MM-YYYY'),'G037','TK02',to_date('05-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B070',to_date('26-03-2019','DD-MM-YYYY'),'G038','TK02',to_date('26-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B071',to_date('07-03-2019','DD-MM-YYYY'),'G022','TK01',to_date('10-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B072',to_date('07-03-2019','DD-MM-YYYY'),'G014','TK03',to_date('07-03-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',4,4);
insert into booking values('B073',to_date('26-03-2019','DD-MM-YYYY'),'G016','TK02',to_date('28-03-2019','DD-MM-YYYY'),4,6000000,'sudah dibayar',1,3);
insert into booking values('B074',to_date('30-03-2019','DD-MM-YYYY'),'G019','TK01',to_date('31-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B075',to_date('27-03-2019','DD-MM-YYYY'),'G035','TK01',to_date('28-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B076',to_date('25-03-2019','DD-MM-YYYY'),'G025','TK01',to_date('27-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B077',to_date('23-03-2019','DD-MM-YYYY'),'G042','TK01',to_date('25-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B078',to_date('04-03-2019','DD-MM-YYYY'),'G009','TK01',to_date('05-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B079',to_date('13-03-2019','DD-MM-YYYY'),'G027','TK04',to_date('15-03-2019','DD-MM-YYYY'),4,9600000,'sudah dibayar',1,5); 
insert into booking values('B080',to_date('02-03-2019','DD-MM-YYYY'),'G031','TK03',to_date('05-03-2019','DD-MM-YYYY'),3,6000000,'sudah dibayar',1,4);
insert into booking values('B081',to_date('30-03-2019','DD-MM-YYYY'),'G026','TK01',to_date('30-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',3,2);
insert into booking values('B082',to_date('14-03-2019','DD-MM-YYYY'),'G022','TK01',to_date('16-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B083',to_date('10-03-2019','DD-MM-YYYY'),'G012','TK01',to_date('12-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B084',to_date('17-03-2019','DD-MM-YYYY'),'G036','TK02',to_date('19-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B085',to_date('25-03-2019','DD-MM-YYYY'),'G027','TK02',to_date('25-03-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B086',to_date('05-03-2019','DD-MM-YYYY'),'G007','TK02',to_date('09-03-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B087',to_date('01-03-2019','DD-MM-YYYY'),'G030','TK01',to_date('04-03-2019','DD-MM-YYYY'),4,4000000,'sudah dibayar',1,2);// sampek sini sudah
insert into booking values('B088',to_date('02-03-2019','DD-MM-YYYY'),'G033','TK01',to_date('04-03-2019','DD-MM-YYYY'),5,5000000,'sudah dibayar',1,2);
insert into booking values('B089',to_date('28-03-2019','DD-MM-YYYY'),'G006','TK04',to_date('30-03-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B090',to_date('17-03-2019','DD-MM-YYYY'),'G026','TK03',to_date('20-03-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B091',to_date('08-03-2019','DD-MM-YYYY'),'G023','TK01',to_date('10-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B092',to_date('22-03-2019','DD-MM-YYYY'),'G037','TK01',to_date('25-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B093',to_date('09-03-2019','DD-MM-YYYY'),'G037','TK01',to_date('12-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B094',to_date('19-03-2019','DD-MM-YYYY'),'G013','TK02',to_date('20-03-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B095',to_date('09-03-2019','DD-MM-YYYY'),'G001','TK01',to_date('09-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',2,2);
insert into booking values('B096',to_date('27-03-2019','DD-MM-YYYY'),'G022','TK01',to_date('31-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B097',to_date('16-03-2019','DD-MM-YYYY'),'G009','TK01',to_date('18-03-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B098',to_date('22-03-2019','DD-MM-YYYY'),'G034','TK01',to_date('26-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B099',to_date('11-03-2019','DD-MM-YYYY'),'G029','TK01',to_date('14-03-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B100',to_date('17-03-2019','DD-MM-YYYY'),'G029','TK01',to_date('17-03-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B101',to_date('13-06-2019','DD-MM-YYYY'),'G004','TK01',to_date('25-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,2);
insert into booking values('B102',to_date('24-06-2019','DD-MM-YYYY'),'G025','TK04',to_date('30-06-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',3,5);
insert into booking values('B103',to_date('14-06-2019','DD-MM-YYYY'),'G031','TK03',to_date('15-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',2,4);
insert into booking values('B104',to_date('07-06-2019','DD-MM-YYYY'),'G039','TK02',to_date('10-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B105',to_date('25-06-2019','DD-MM-YYYY'),'G023','TK01',to_date('26-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B106',to_date('09-06-2019','DD-MM-YYYY'),'G028','TK01',to_date('16-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B107',to_date('10-06-2019','DD-MM-YYYY'),'G014','TK01',to_date('21-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B108',to_date('20-06-2019','DD-MM-YYYY'),'G019','TK03',to_date('29-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B109',to_date('21-06-2019','DD-MM-YYYY'),'G005','TK04',to_date('25-06-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',2,5);
insert into booking values('B110',to_date('16-06-2019','DD-MM-YYYY'),'G003','TK02',to_date('19-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);//sudah 
--wes
insert into booking values('B111',to_date('02-06-2019','DD-MM-YYYY'),'G001','TK02',to_date('05-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B112',to_date('05-06-2019','DD-MM-YYYY'),'G033','TK03',to_date('22-06-2019','DD-MM-YYYY'),4,8000000,'sudah dibayar',1,4);
insert into booking values('B113',to_date('03-06-2019','DD-MM-YYYY'),'G040','TK03',to_date('13-06-2019','DD-MM-YYYY'),3,6000000,'sudah dibayar',1,4);
insert into booking values('B114',to_date('22-06-2019','DD-MM-YYYY'),'G016','TK04',to_date('28-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B115',to_date('24-06-2019','DD-MM-YYYY'),'G008','TK02',to_date('26-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B116',to_date('25-06-2019','DD-MM-YYYY'),'G010','TK01',to_date('27-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',2,2);
insert into booking values('B117',to_date('16-06-2019','DD-MM-YYYY'),'G013','TK01',to_date('16-06-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B118',to_date('30-06-2019','DD-MM-YYYY'),'G020','TK01',to_date('30-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B119',to_date('08-06-2019','DD-MM-YYYY'),'G022','TK03',to_date('15-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',2,4);
insert into booking values('B120',to_date('24-06-2019','DD-MM-YYYY'),'G021','TK03',to_date('28-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B121',to_date('23-06-2019','DD-MM-YYYY'),'G025','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B122',to_date('05-06-2019','DD-MM-YYYY'),'G016','TK02',to_date('15-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',2,3);
insert into booking values('B123',to_date('20-06-2019','DD-MM-YYYY'),'G005','TK03',to_date('29-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B124',to_date('16-06-2019','DD-MM-YYYY'),'G019','TK02',to_date('19-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B125',to_date('24-06-2019','DD-MM-YYYY'),'G021','TK04',to_date('27-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',3,5);
insert into booking values('B126',to_date('13-06-2019','DD-MM-YYYY'),'G020','TK01',to_date('20-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B127',to_date('21-06-2019','DD-MM-YYYY'),'G028','TK04',to_date('22-06-2019','DD-MM-YYYY'),4,9600000,'sudah dibayar',1,5);
insert into booking values('B128',to_date('28-06-2019','DD-MM-YYYY'),'G012','TK03',to_date('29-06-2019','DD-MM-YYYY'),3,6000000,'sudah dibayar',1,4);
insert into booking values('B129',to_date('18-06-2019','DD-MM-YYYY'),'G030','TK01',to_date('20-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B130',to_date('11-06-2019','DD-MM-YYYY'),'G007','TK01',to_date('18-06-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B131',to_date('25-06-2019','DD-MM-YYYY'),'G043','TK01',to_date('29-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B132',to_date('22-06-2019','DD-MM-YYYY'),'G019','TK02',to_date('24-06-2019','DD-MM-YYYY'),2,3200000,'sudah dibayar',1,3);
insert into booking values('B133',to_date('20-06-2019','DD-MM-YYYY'),'G040','TK01',to_date('22-06-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B134',to_date('28-06-2019','DD-MM-YYYY'),'G041','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3200000,'sudah dibayar',1,3);
insert into booking values('B135',to_date('29-06-2019','DD-MM-YYYY'),'G017','TK01',to_date('30-06-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B136',to_date('30-06-2019','DD-MM-YYYY'),'G006','TK03',to_date('30-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B137',to_date('24-06-2019','DD-MM-YYYY'),'G033','TK01',to_date('25-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',3,2);
insert into booking values('B138',to_date('30-06-2019','DD-MM-YYYY'),'G004','TK04',to_date('30-06-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B139',to_date('17-06-2019','DD-MM-YYYY'),'G032','TK03',to_date('19-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B140',to_date('29-06-2019','DD-MM-YYYY'),'G012','TK04',to_date('30-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B141',to_date('01-06-2019','DD-MM-YYYY'),'G023','TK01',to_date('05-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',2,2);
insert into booking values('B142',to_date('19-06-2019','DD-MM-YYYY'),'G023','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B143',to_date('07-06-2019','DD-MM-YYYY'),'G035','TK01',to_date('10-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B144',to_date('28-06-2019','DD-MM-YYYY'),'G021','TK02',to_date('30-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B145',to_date('15-06-2019','DD-MM-YYYY'),'G031','TK03',to_date('19-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B146',to_date('18-06-2019','DD-MM-YYYY'),'G003','TK03',to_date('20-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B147',to_date('01-06-2019','DD-MM-YYYY'),'G001','TK02',to_date('06-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',2,3);
insert into booking values('B148',to_date('08-06-2019','DD-MM-YYYY'),'G016','TK02',to_date('10-06-2019','DD-MM-YYYY'),4,6000000,'sudah dibayar',2,3);
insert into booking values('B149',to_date('10-06-2019','DD-MM-YYYY'),'G038','TK02',to_date('20-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B150',to_date('28-06-2019','DD-MM-YYYY'),'G026','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B151',to_date('14-06-2019','DD-MM-YYYY'),'G029','TK04',to_date('17-06-2019','DD-MM-YYYY'),5,12000000,'sudah dibayar',2,5);
insert into booking values('B152',to_date('11-06-2019','DD-MM-YYYY'),'G028','TK01',to_date('14-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B153',to_date('21-06-2019','DD-MM-YYYY'),'G004','TK02',to_date('21-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B154',to_date('12-06-2019','DD-MM-YYYY'),'G037','TK01',to_date('18-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B155',to_date('07-06-2019','DD-MM-YYYY'),'G008','TK02',to_date('10-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B156',to_date('09-06-2019','DD-MM-YYYY'),'G036','TK01',to_date('12-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B157',to_date('27-06-2019','DD-MM-YYYY'),'G022','TK01',to_date('27-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B158',to_date('10-06-2019','DD-MM-YYYY'),'G019','TK02',to_date('14-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B159',to_date('15-06-2019','DD-MM-YYYY'),'G033','TK04',to_date('17-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B160',to_date('27-06-2019','DD-MM-YYYY'),'G013','TK03',to_date('28-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B161',to_date('28-06-2019','DD-MM-YYYY'),'G041','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B162',to_date('20-06-2019','DD-MM-YYYY'),'G004','TK01',to_date('22-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B163',to_date('10-06-2019','DD-MM-YYYY'),'G033','TK03',to_date('18-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B164',to_date('23-06-2019','DD-MM-YYYY'),'G010','TK03',to_date('25-06-2019','DD-MM-YYYY'),3,6000000,'sudah dibayar',1,4);
insert into booking values('B165',to_date('17-06-2019','DD-MM-YYYY'),'G008','TK03',to_date('19-06-2019','DD-MM-YYYY'),3,6000000,'sudah dibayar',3,4);
insert into booking values('B166',to_date('21-06-2019','DD-MM-YYYY'),'G002','TK01',to_date('27-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B167',to_date('06-06-2019','DD-MM-YYYY'),'G035','TK02',to_date('08-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B168',to_date('12-06-2019','DD-MM-YYYY'),'G028','TK03',to_date('13-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B169',to_date('05-06-2019','DD-MM-YYYY'),'G014','TK02',to_date('09-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B170',to_date('15-06-2019','DD-MM-YYYY'),'G014','TK02',to_date('18-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',2,3);
insert into booking values('B171',to_date('18-06-2019','DD-MM-YYYY'),'G032','TK03',to_date('20-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B172',to_date('29-06-2019','DD-MM-YYYY'),'G039','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',2,3);
insert into booking values('B173',to_date('29-06-2019','DD-MM-YYYY'),'G028','TK01',to_date('30-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B174',to_date('27-06-2019','DD-MM-YYYY'),'G038','TK01',to_date('29-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B175',to_date('18-06-2019','DD-MM-YYYY'),'G034','TK04',to_date('19-06-2019','DD-MM-YYYY'),5,12000000,'sudah dibayar',1,5);
insert into booking values('B176',to_date('20-06-2019','DD-MM-YYYY'),'G021','TK03',to_date('23-06-2019','DD-MM-YYYY'),7,14000000,'sudah dibayar',1,4);
insert into booking values('B177',to_date('29-06-2019','DD-MM-YYYY'),'G015','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B178',to_date('18-06-2019','DD-MM-YYYY'),'G038','TK01',to_date('24-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B179',to_date('08-06-2019','DD-MM-YYYY'),'G030','TK03',to_date('11-06-2019','DD-MM-YYYY'),3,6000000,'sudah dibayar',1,4);
insert into booking values('B180',to_date('01-06-2019','DD-MM-YYYY'),'G034','TK04',to_date('11-06-2019','DD-MM-YYYY'),4,9600000,'sudah dibayar',1,5);
insert into booking values('B181',to_date('15-06-2019','DD-MM-YYYY'),'G021','TK02',to_date('18-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B182',to_date('02-06-2019','DD-MM-YYYY'),'G015','TK03',to_date('03-06-2019','DD-MM-YYYY'),5,10000000,'sudah dibayar',1,4);
insert into booking values('B183',to_date('29-06-2019','DD-MM-YYYY'),'G038','TK01',to_date('30-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B184',to_date('07-06-2019','DD-MM-YYYY'),'G030','TK02',to_date('04-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B185',to_date('06-06-2019','DD-MM-YYYY'),'G023','TK01',to_date('07-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B186',to_date('15-06-2019','DD-MM-YYYY'),'G019','TK04',to_date('17-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B187',to_date('12-06-2019','DD-MM-YYYY'),'G008','TK02',to_date('18-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B188',to_date('03-06-2019','DD-MM-YYYY'),'G019','TK02',to_date('06-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',2,3);
insert into booking values('B189',to_date('11-06-2019','DD-MM-YYYY'),'G017','TK01',to_date('14-06-2019','DD-MM-YYYY'),4,1000000,'sudah dibayar',1,2);
insert into booking values('B190',to_date('16-06-2019','DD-MM-YYYY'),'G018','TK03',to_date('18-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B191',to_date('16-06-2019','DD-MM-YYYY'),'G016','TK04',to_date('18-06-2019','DD-MM-YYYY'),5,12000000,'sudah dibayar',1,5);
insert into booking values('B192',to_date('26-06-2019','DD-MM-YYYY'),'G031','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B193',to_date('30-06-2019','DD-MM-YYYY'),'G013','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B194',to_date('03-06-2019','DD-MM-YYYY'),'G027','TK01',to_date('05-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B195',to_date('24-06-2019','DD-MM-YYYY'),'G026','TK03',to_date('26-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B196',to_date('28-06-2019','DD-MM-YYYY'),'G012','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',2,3);
insert into booking values('B197',to_date('06-06-2019','DD-MM-YYYY'),'G001','TK02',to_date('10-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B198',to_date('24-06-2019','DD-MM-YYYY'),'G031','TK03',to_date('28-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B199',to_date('12-06-2019','DD-MM-YYYY'),'G005','TK01',to_date('15-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B200',to_date('18-06-2019','DD-MM-YYYY'),'G015','TK02',to_date('20-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B201',to_date('26-06-2019','DD-MM-YYYY'),'G031','TK01',to_date('28-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B202',to_date('28-06-2019','DD-MM-YYYY'),'G005','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B203',to_date('14-06-2019','DD-MM-YYYY'),'G015','TK02',to_date('18-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B204',to_date('20-06-2019','DD-MM-YYYY'),'G027','TK02',to_date('25-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B205',to_date('15-06-2019','DD-MM-YYYY'),'G011','TK01',to_date('18-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B206',to_date('01-06-2019','DD-MM-YYYY'),'G036','TK02',to_date('05-06-2019','DD-MM-YYYY'),5,7500000,'sudah dibayar',1,3);
insert into booking values('B207',to_date('30-06-2019','DD-MM-YYYY'),'G013','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B208',to_date('01-06-2019','DD-MM-YYYY'),'G032','TK02',to_date('05-06-2019','DD-MM-YYYY'),2,1500000,'sudah dibayar',1,3);
insert into booking values('B209',to_date('03-06-2019','DD-MM-YYYY'),'G017','TK03',to_date('07-06-2019','DD-MM-YYYY'),5,10000000,'sudah dibayar',1,4);
insert into booking values('B210',to_date('23-06-2019','DD-MM-YYYY'),'G036','TK02',to_date('25-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B211',to_date('09-06-2019','DD-MM-YYYY'),'G038','TK04',to_date('11-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B212',to_date('02-06-2019','DD-MM-YYYY'),'G017','TK04',to_date('07-06-2019','DD-MM-YYYY'),5,12000000,'sudah dibayar',1,5);
insert into booking values('B213',to_date('01-06-2019','DD-MM-YYYY'),'G012','TK02',to_date('10-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B214',to_date('05-06-2019','DD-MM-YYYY'),'G027','TK02',to_date('09-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',3,3);
insert into booking values('B215',to_date('26-06-2019','DD-MM-YYYY'),'G004','TK01',to_date('30-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B216',to_date('18-06-2019','DD-MM-YYYY'),'G005','TK02',to_date('20-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B217',to_date('28-06-2019','DD-MM-YYYY'),'G025','TK01',to_date('30-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B218',to_date('12-06-2019','DD-MM-YYYY'),'G014','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B219',to_date('21-06-2019','DD-MM-YYYY'),'G001','TK02',to_date('24-06-2019','DD-MM-YYYY'),3,4500000,'sudah dibayar',1,3);
insert into booking values('B220',to_date('13-06-2019','DD-MM-YYYY'),'G023','TK01',to_date('17-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B221',to_date('08-06-2019','DD-MM-YYYY'),'G006','TK03',to_date('13-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B222',to_date('04-06-2019','DD-MM-YYYY'),'G011','TK04',to_date('07-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B223',to_date('14-06-2019','DD-MM-YYYY'),'G039','TK01',to_date('16-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B224',to_date('09-06-2019','DD-MM-YYYY'),'G031','TK01',to_date('19-06-2019','DD-MM-YYYY'),3,3000000,'sudah dibayar',1,2);
insert into booking values('B225',to_date('21-06-2019','DD-MM-YYYY'),'G031','TK03',to_date('25-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B226',to_date('25-06-2019','DD-MM-YYYY'),'G039','TK04',to_date('29-06-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B227',to_date('04-06-2019','DD-MM-YYYY'),'G013','TK03',to_date('05-06-2019','DD-MM-YYYY'),1,2000000,'sudah dibayar',1,4);
insert into booking values('B228',to_date('21-06-2019','DD-MM-YYYY'),'G021','TK02',to_date('22-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B229',to_date('18-06-2019','DD-MM-YYYY'),'G022','TK01',to_date('23-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B230',to_date('11-06-2019','DD-MM-YYYY'),'G008','TK04',to_date('16-06-2019','DD-MM-YYYY'),3,7200000,'sudah dibayar',1,5);
insert into booking values('B231',to_date('28-06-2019','DD-MM-YYYY'),'G024','TK04',to_date('30-06-2019','DD-MM-YYYY'),1,2400000,'sudah dibayar',1,5);
insert into booking values('B232',to_date('02-06-2019','DD-MM-YYYY'),'G023','TK03',to_date('05-06-2019','DD-MM-YYYY'),4,8000000,'sudah dibayar',1,4);
insert into booking values('B233',to_date('11-06-2019','DD-MM-YYYY'),'G034','TK02',to_date('17-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B234',to_date('28-06-2019','DD-MM-YYYY'),'G033','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B235',to_date('02-06-2019','DD-MM-YYYY'),'G012','TK02',to_date('09-06-2019','DD-MM-YYYY'),5,7500000,'sudah dibayar',1,3);
insert into booking values('B236',to_date('11-06-2019','DD-MM-YYYY'),'G001','TK02',to_date('16-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',2,3);
insert into booking values('B237',to_date('06-06-2019','DD-MM-YYYY'),'G015','TK01',to_date('13-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B238',to_date('17-06-2019','DD-MM-YYYY'),'G042','TK01',to_date('19-06-2019','DD-MM-YYYY'),2,2000000,'sudah dibayar',1,2);
insert into booking values('B239',to_date('22-06-2019','DD-MM-YYYY'),'G004','TK02',to_date('25-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B240',to_date('18-06-2019','DD-MM-YYYY'),'G041','TK02',to_date('20-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B241',to_date('20-06-2019','DD-MM-YYYY'),'G015','TK02',to_date('30-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B242',to_date('15-06-2019','DD-MM-YYYY'),'G023','TK02',to_date('18-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B243',to_date('22-06-2019','DD-MM-YYYY'),'G041','TK04',to_date('27-06-2019','DD-MM-YYYY'),2,4800000,'sudah dibayar',1,5);
insert into booking values('B244',to_date('07-06-2019','DD-MM-YYYY'),'G018','TK02',to_date('27-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B245',to_date('25-06-2019','DD-MM-YYYY'),'G035','TK03',to_date('29-06-2019','DD-MM-YYYY'),2,4000000,'sudah dibayar',1,4);
insert into booking values('B246',to_date('30-06-2019','DD-MM-YYYY'),'G004','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B247',to_date('04-06-2019','DD-MM-YYYY'),'G023','TK02',to_date('09-06-2019','DD-MM-YYYY'),2,3000000,'sudah dibayar',1,3);
insert into booking values('B248',to_date('23-06-2019','DD-MM-YYYY'),'G022','TK02',to_date('30-06-2019','DD-MM-YYYY'),1,1500000,'sudah dibayar',1,3);
insert into booking values('B249',to_date('27-06-2019','DD-MM-YYYY'),'G026','TK01',to_date('30-06-2019','DD-MM-YYYY'),1,1000000,'sudah dibayar',1,2);
insert into booking values('B250',to_date('09-06-2019','DD-MM-YYYY'),'G003','TK01',to_date('12-06-2019','DD-MM-YYYY'),5,5000000,'sudah dibayar',1,2);


insert into transaction values ('TR01','721',to_date('10-06-2019','DD-MM-YYYY'),to_date('11-06-2019','DD-MM-YYYY'),'B104',2250000); 
insert into transaction values ('TR02','916',to_date('13-06-2019','DD-MM-YYYY'),to_date('16-06-2019','DD-MM-YYYY'),'B113',3000000); 
insert into transaction values ('TR03','809',to_date('15-06-2019','DD-MM-YYYY'),to_date('17-06-2019','DD-MM-YYYY'),'B119',6000000); 
insert into transaction values ('TR04','810',to_date('15-06-2019','DD-MM-YYYY'),to_date('17-06-2019','DD-MM-YYYY'),'B119',6000000); 
insert into transaction values ('TR05','619',to_date('19-06-2019','DD-MM-YYYY'),to_date('21-06-2019','DD-MM-YYYY'),'B124',4500000); 
insert into transaction values ('TR06','808',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B136',6000000); 
insert into transaction values ('TR07','217',to_date('10-06-2019','DD-MM-YYYY'),to_date('12-06-2019','DD-MM-YYYY'),'B143',3000000);  
insert into transaction values ('TR08','1002',to_date('17-06-2019','DD-MM-YYYY'),to_date('22-06-2019','DD-MM-YYYY'),'B151',18000000); 
insert into transaction values ('TR09','1003',to_date('17-06-2019','DD-MM-YYYY'),to_date('22-06-2019','DD-MM-YYYY'),'B151',18000000); 
insert into transaction values ('TR10','801',to_date('28-06-2019','DD-MM-YYYY'),to_date('30-06-2019','DD-MM-YYYY'),'B160',6000000); 
insert into transaction values ('TR11','1001',to_date('19-06-2019','DD-MM-YYYY'),to_date('24-06-2019','DD-MM-YYYY'),'B175',18000000);
insert into transaction values ('TR12','806',to_date('18-06-2019','DD-MM-YYYY'),to_date('20-06-2019','DD-MM-YYYY'),'B190',6000000); 
insert into transaction values ('TR13','321',to_date('05-06-2019','DD-MM-YYYY'),to_date('07-06-2019','DD-MM-YYYY'),'B194',3000000); 
insert into transaction values ('TR14','722',to_date('20-06-2019','DD-MM-YYYY'),to_date('21-06-2019','DD-MM-YYYY'),'B200',2250000); 
insert into transaction values ('TR15','1009',to_date('11-06-2019','DD-MM-YYYY'),to_date('13-06-2019','DD-MM-YYYY'),'B211',7200000); 
insert into transaction values ('TR16','617',to_date('24-06-2019','DD-MM-YYYY'),to_date('27-06-2019','DD-MM-YYYY'),'B219',6750000); 
insert into transaction values ('TR17','330',to_date('17-06-2019','DD-MM-YYYY'),to_date('19-06-2019','DD-MM-YYYY'),'B220',3000000); 
insert into transaction values ('TR18','1010',to_date('07-06-2019','DD-MM-YYYY'),to_date('09-06-2019','DD-MM-YYYY'),'B222',7200000); 
insert into transaction values ('TR19','107',to_date('19-06-2019','DD-MM-YYYY'),to_date('22-06-2019','DD-MM-YYYY'),'B224',4500000);
insert into transaction values ('TR20','1007',to_date('16-06-2019','DD-MM-YYYY'),to_date('19-06-2019','DD-MM-YYYY'),'B230',10800000); 
insert into transaction values ('TR21','1008',to_date('10-03-2019','DD-MM-YYYY'),to_date('11-03-2019','DD-MM-YYYY'),'B016',3600000);
insert into transaction values ('TR22','808',to_date('05-03-2019','DD-MM-YYYY'),to_date('06-03-2019','DD-MM-YYYY'),'B021',2000000);
insert into transaction values ('TR23','326',to_date('14-06-2019','DD-MM-YYYY'),to_date('15-06-2019','DD-MM-YYYY'),'B152',1000000);
insert into transaction values ('TR24','322',to_date('17-03-2019','DD-MM-YYYY'),to_date('18-03-2019','DD-MM-YYYY'),'B100',1000000);
insert into transaction values ('TR25','615',to_date('25-03-2019','DD-MM-YYYY'),to_date('28-03-2019','DD-MM-YYYY'),'B085',4500000);
insert into transaction values ('TR26','503',to_date('25-03-2019','DD-MM-YYYY'),to_date('28-03-2019','DD-MM-YYYY'),'B085',4500000);
insert into transaction values ('TR27','723',to_date('25-03-2019','DD-MM-YYYY'),to_date('28-03-2019','DD-MM-YYYY'),'B085',4500000);
insert into transaction values ('TR28','1004',to_date('30-03-2019','DD-MM-YYYY'),to_date('01-04-2019','DD-MM-YYYY'),'B089',4800000);
insert into transaction values ('TR29','1006',to_date('16-03-2019','DD-MM-YYYY'),to_date('20-03-2019','DD-MM-YYYY'),'B024',9600000); 
insert into transaction values ('TR30','804',to_date('20-06-2019','DD-MM-YYYY'),to_date('22-06-2019','DD-MM-YYYY'),'B171',6000000);
insert into transaction values ('TR31','806',to_date('13-06-2019','DD-MM-YYYY'),to_date('14-06-2019','DD-MM-YYYY'),'B221',3000000);
insert into transaction values ('TR32','618',to_date('10-06-2019','DD-MM-YYYY'),to_date('12-06-2019','DD-MM-YYYY'),'B197',4500000);
insert into transaction values ('TR33','1005',to_date('07-03-2019','DD-MM-YYYY'),to_date('08-03-2019','DD-MM-YYYY'),'B019',2400000);
insert into transaction values ('TR34','327',to_date('13-03-2019','DD-MM-YYYY'),to_date('16-03-2019','DD-MM-YYYY'),'B060',3000000); 
insert into transaction values ('TR35','109',to_date('29-03-2019','DD-MM-YYYY'),to_date('30-03-2019','DD-MM-YYYY'),'B013',1000000); 
insert into transaction values ('TR36','507',to_date('19-06-2019','DD-MM-YYYY'),to_date('20-06-2019','DD-MM-YYYY'),'B139',1500000); 
insert into transaction values ('TR37','432',to_date('18-06-2019','DD-MM-YYYY'),to_date('20-06-2019','DD-MM-YYYY'),'B205',3000000); 
insert into transaction values ('TR38','616',to_date('28-03-2019','DD-MM-YYYY'),to_date('01-04-2019','DD-MM-YYYY'),'B073',6000000); 
insert into transaction values ('TR39','323',to_date('25-03-2019','DD-MM-YYYY'),to_date('26-03-2019','DD-MM-YYYY'),'B092',1000000); 
insert into transaction values ('TR40','615',to_date('24-06-2019','DD-MM-YYYY'),to_date('27-06-2019','DD-MM-YYYY'),'B219',6750000); 
insert into transaction values ('TR41','433',to_date('19-06-2019','DD-MM-YYYY'),to_date('21-06-2019','DD-MM-YYYY'),'B238',3000000); 
insert into transaction values ('TR42','807',to_date('26-06-2019','DD-MM-YYYY'),to_date('27-06-2019','DD-MM-YYYY'),'B195',6000000);  
insert into transaction values ('TR43','724',to_date('09-06-2019','DD-MM-YYYY'),to_date('11-06-2019','DD-MM-YYYY'),'B247',4500000); 
insert into transaction values ('TR44','110',to_date('28-03-2019','DD-MM-YYYY'),to_date('29-03-2019','DD-MM-YYYY'),'B075',1500000); 
insert into transaction values ('TR45','215',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B135',3000000); 
insert into transaction values ('TR46','508',to_date('28-03-2019','DD-MM-YYYY'),to_date('29-03-2019','DD-MM-YYYY'),'B031',1500000); 
insert into transaction values ('TR47','616',to_date('30-06-2019','DD-MM-YYYY'),to_date('01-07-2019','DD-MM-YYYY'),'B241',2250000); 
insert into transaction values ('TR48','105',to_date('27-03-2019','DD-MM-YYYY'),to_date('28-03-2019','DD-MM-YYYY'),'B057',1000000); 
insert into transaction values ('TR49','438',to_date('10-03-2019','DD-MM-YYYY'),to_date('15-03-019','DD-MM-YYYY'),'B064',5000000); 
insert into transaction values ('TR50','612',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B102',4500000);
insert into transaction values ('TR51','613',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B102',4500000);
insert into transaction values ('TR52','809',to_date('08-03-2019','DD-MM-YYYY'),to_date('12-03-2019','DD-MM-YYYY'),'B040',8000000); 
insert into transaction values ('TR53','437',to_date('11-03-2019','DD-MM-YYYY'),to_date('15-03-2019','DD-MM-YYYY'),'B034',4000000); 
insert into transaction values ('TR54','1006',to_date('31-03-2019','DD-MM-YYYY'),to_date('03-04-2019','DD-MM-YYYY'),'B017',7200000);
insert into transaction values ('TR55','1004',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B102',7200000); 
insert into transaction values ('TR56','1003',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B102',7200000);
insert into transaction values ('TR57','1005',to_date('30-06-2019','DD-MM-YYYY'),to_date('02-07-2019','DD-MM-YYYY'),'B102',7200000);


insert into transaction_detail values('721',1,25000,1,'S04','TR01');
insert into transaction_detail values('112',1,65000,1,'S03','TR19');
insert into transaction_detail values('422',1,60000,1,'S06','TR37');
insert into transaction_detail values('438',1,15000,1,'S13','TR49');
insert into transaction_detail values('612',1,23000,1,'S12','TR50');
insert into transaction_detail values('1009',1,30000,1,'S10','TR15');
insert into transaction_detail values('724',1,47000,1,'S09','TR43');
insert into transaction_detail values('433',1,25000,1,'S01','TR41');
insert into transaction_detail values('503',1,175000,1,'S02','TR26');
insert into transaction_detail values('721',1,30000,2,'S11','TR01');
insert into transaction_detail values('801',1,23000,1,'S12','TR10');
insert into transaction_detail values('616',1,15000,1,'S13','TR47');
insert into transaction_detail values('816',1,23000,1,'S12','TR42');
insert into transaction_detail values('808',1,65000,1,'S03','TR22');
insert into transaction_detail values('326',1,175000,1,'S02','TR23');

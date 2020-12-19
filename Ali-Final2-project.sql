drop database if exists Ali;
create database Ali;
use Ali;

create table company(
  cy_ticker varchar(20) PRIMARY KEY,
  cy_name VARCHAR(100) NOT NULL
);

create table conference(
  cf_id NUMERIC(20,4) PRIMARY KEY,
  cf_title VARCHAR(500) NOT NULL,
 # cf_date DATE,
 cf_date varchar(100),
  #cf_time TIME,
  cf_time varchar(100),
  cf_qnum varcharacter(50),
  cf_year varchar(6),
  cy_ticker VARCHAR(20),
  foreign key (cy_ticker) references company(cy_ticker)
);

create table participant(
 # p_id NUMERIC(4,0) PRIMARY KEY ,
  p_name VARCHAR(50),
  p_type VARCHAR(100),
  p_org VARCHAR(50),
  cf_id NUMERIC(20,4),
  foreign key (cf_id) references conference(cf_id),
   PRIMARY KEY(p_name,cf_id)
);
#drop table participant;
create table speech(
 
  speech_id int(20) ,  
    p_name VARCHAR(50),
    speech_section VARCHAR(100),
    s_text longtext,
  cf_id NUMERIC(20,4) ,
  #p_id NUMERIC(4,0),
  foreign key (p_name) references participant(p_name),
	foreign key (cf_id) references conference(cf_id),
    PRIMARY KEY(speech_id)
);
#drop table speech;


SELECT * FROM company;
select  *  from conference;
select * from participant;
select  *  from speech  ;

-- load data local infile 'C:\\Users\\alita\\Desktop\\New folder\\speech.csv'
-- into table speech
-- fields terminated by ','
-- enclosed by '"'
-- lines terminated by '\n'
-- ignore 1 rows;



# Q1
 #    a.	How many conference calls in your database occurred in 2020? 
select count(*) from conference
where cf_year = '2020';

#Q2
#b.	Print their ticker name and date
select cy_ticker , cf_date from conference where cf_year = 2020;


#Q3
# Given a ticker name and a specific date, how many participants and who are them? 
select count(p.p_name) from conference as c inner join participant as p on c.cf_id=p.cf_id where c.cy_ticker = 'ALOT' and c.cf_date = '12/7/2020';

# who are they?
select p.p_name from conference as c inner join participant as p on c.cf_id=p.cf_id where c.cy_ticker = 'ALOT' and  c.cf_date = '12/7/2020';



#Q4

# c.	Given a ticker name and a specific date, how many are company participants 
select count(p.p_name) from conference as c inner join participant as p on c.cf_id=p.cf_id where c.cy_ticker = 'ALOT' and c.cf_date = '12/7/2020' and p.p_type != 'guest participant';

#how many are conference call participants
select count(p.p_name) from conference as c inner join participant as p on c.cf_id=p.cf_id where c.cy_ticker = 'ALOT' and c.cf_date = '12/7/2020' and p.p_type = 'guest participant';

# Q5  given the name of this participants, along with the ticker name and date? 
select  s_text , p_name from  conference c, speech s where c.cy_ticker = 'ALOT' and c.cf_date = '12/7/2020' and  s.p_name ='Dan Bodner' ;













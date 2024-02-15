CREATE or replace TYPE zexec.address_info_ext as OBJECT
(
   home_address VARCHAR2 (120),
   work_address VARCHAR2 (120),
   other_address VARCHAR2(120)
);
/

CREATE or replace TYPE zexec.phone_info_ext as OBJECT
(
   home_phone VARCHAR2 (12),
   work_phone VARCHAR2 (12),
   other_phone VARCHAR2(12)
);
/
create or replace type zexec.address_info as table of zexec.address_info_ext;
/

create or replace type zexec.phone_info as table of zexec.phone_info_ext;
/


create  sequence zexec.donerinfo_seq
increment by 1
start with 1
minvalue 0
maxvalue 9999999999999999999999999999
NOCYCLE;

---whole database

create table  zexec.zdonations
(
 donor_seq_no number default zexec.donerinfo_seq.nextval,
 donor_ssn varchar2(12),
 donor_name varchar2(120),
 donor_birth_date date,
 donor_ethnicity varchar2(60),
 donor_address zexec.address_info,
 donor_phone_info zexec.phone_info,
 donation_type varchar2(12),
 donation_date date,
 donation_amount number,
 donation_memo varchar2(300),
 constraint donation_uk PRIMARY KEY (donation_type,donation_date,donation_amount,donation_memo) 
 --A single person may have zero, one, or several donations; but each donation has only one Type, Date, Amount, and Memo.
 )
 nested table donor_address  store as nested_donor_addr
 nested table donor_phone_info  store as nested_phone_space;
 
 
 
comment on table zexec.zdonations is 'Donations';
comment on column  zexec.zdonations.donation_type is 'Cash, Check, Credit Card, Etc';
comment on column zexec.zdonations.donation_date is 'Date of donation';
comment on column zexec.zdonations.donation_amount is 'Donor donated amount';
comment on column zexec.zdonations.donation_memo is 'Meaningful memo from donor';

 
----insert statement

 insert into zexec.zdonations(donor_ssn,
                              donor_name,
                              donor_birth_date,
                              donor_ethnicity,
                              donor_address,
                              donor_phone_info,
                              donation_type,
                              donation_date,
                              donation_amount,
                              donation_memo)
 values 
 (
 '123-45-789',
 'John Smith',
 to_date('01/21/1987','MM/DD/YYYY'),
 'Latino',
zexec.address_info( zexec.address_info_ext(home_address  => '1971 University blvd, Lynchburg, VA 24502',
                       work_address  => '81 South avenue, Madison, Ohio',
                       other_address => '1920 Alleghany Ave, Clifton, NJ  07011')),
zexec.phone_info( zexec.phone_info_ext(home_phone  => '434-777-1783',
                      work_phone  => '437-791-1894',
                      other_phone => '434-592-3970' )),
 'CREDITCARD',
 trunc(sysdate),
 250,
 'memo test');                    


 



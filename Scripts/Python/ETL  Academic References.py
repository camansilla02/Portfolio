import keyring
import cx_Oracle
import os

#Get data from other environment and push it to production XML staging table. For security purposes datapoints such as username, password, and sql tables have been obscured

##Generic credential manager this needs to exist in order for the script to run on Windows credential manager
user_acc = "REPORTING_ACC"
cred = "reporting_acc.svc"
pwd = keyring.get_password(cred, user_acc)
#conn_str = user_acc+'/'+pwd+u'@SOMEENV'
conn = cx_Oracle.connect(user_acc,pwd, "SOMEENV",encoding="UTF-8",nencoding="UTF-8") 
cur = conn.cursor()


#use sql to convert data to XML and insert into xml table

sql_to_xml = """Select y.Student_LUID ||' '||case when appl.camp_code='D' then 'LUO' when appl.camp_code='R' then 'RES' end||' Adm Recommendation Form'||' '||to_char(y.end_date,'DD-MON-YYYY HH:MIPM')||' '|| y.rec_name formname,xmlelement("formdata",sys_xmlagg(xmlforest( 
'Academic Reference Letter Recommender Comments' as Survey_Name,
y.response_id as survey_response_id, 
 y.pidm as pidm, 
 y.username as username,
  y.Student_LUID as stu_idnum,
  y.stu_email as stu_email,
  y.grad_rec_years_months as grad_rec_years_months,
  y.multicheck_grad_rec_know_appl as multicheck_grad_rec_know_appl,
  y.dropdown_grad_rec_acad as dropdown_grad_rec_acad,
  y.dropdown_grad_rec_res as dropdown_grad_rec_res,
  y.dropdown_grad_rec_comp as dropdown_grad_rec_comp,
  y.dropdown_grad_rec_lib as dropdown_grad_rec_lib,
  y.dropdown_grad_rec_comm as dropdown_grad_rec_comm,
  y.dropdown_grad_rec_org as dropdown_grad_rec_org,
  y.dropdown_grad_rec_per as dropdown_grad_rec_per,
  y.dropdown_grad_rec_ach as dropdown_grad_rec_ach,
  y.dropdown_grad_rec_work as dropdown_grad_rec_work,
  y.textarea_grad_rec_professionalism  as textarea_grad_rec_professionalism,
  y.textarea_grad_rec_promise as textarea_grad_rec_promise,
  y.rec_name as rec_name,
  y.rec_work_phone as rec_phone,
  y.rec_address as rec_address,
  y.rec_work_phone as rec_work_phone,
  y.rec_job as rec_job,
  y.rec_fax as rec_fax,
  y.rec_sign  as rec_signature,
  y.rec_date as rec_signature_date
  ))).getClobVal() as Qualtrics_XML,  y.Username, y.pidm
  from  some_schema.some_academic_recommenders_sample y
   join  some_schema.app appl 
  on appl.app_pidm = y.pidm
  and appl.app_program = 'DCED-PHD-D'
  and appl.app_rank = 1
  left join (select EXTRACTVALUE(cml.xml_data, 'formdata/ROWSET/SURVEY_RESPONSE_ID') as Survey_response
from someschema.somexmltable cml where cml.key='SOMEWEBMAKER:RecForms01:001'
and cml.data_origin = 'ZQualtrics')
on survey_response = y.response_id
where survey_response is NULL
and y.END_DATE >= to_date('03/01/2022','MM/DD/YYYY')
  group by y.Student_LUID ||' '||case when appl.camp_code='D' then 'LUO' when appl.camp_code='R' then 'RES' end||' Adm Recommendation Form'||' '||to_char(y.end_date,'DD-MON-YYYY HH:MIPM')||' '|| y.rec_name, y.Username, y.pidm"""

cur.execute(refrain)
rows = cur.fetchall()

prod_cred = 'prod_svc'
prod_user_acc = 'acc_prod'
prod_pwd = keyring.get_password(prod_cred, prod_user_acc)
prod_conn = cx_Oracle.connect(prod_user_acc,prod_pwd, "PROD",encoding="UTF-8") 
prod_session = prod_conn.cursor()
xml_key = 'SOMEWEBMAKER:RecForms01:001'  

ins_sql = '''insert into someschema.somexmltable(form_name, key, form_id, xml_data,data_username,data_pidm,activity_date,status,status_date,user_id,data_origin)
   values(:1,:2,:3,:4,:5,:6,sysdate,'R',sysdate, 'acc_prod','ZSOURCE')'''


for row in rows:
    frm_name = row[0]
    xml_data = row[1].read()
    frm_user = row[2]
    pidm = row[3]
    try:
        prod_session.execute(ins_sql,[frm_name,xml_key,-1,xml_data,frm_user,pidm])
        prod_conn.commit()
    except Exception as err:
        print(err) 

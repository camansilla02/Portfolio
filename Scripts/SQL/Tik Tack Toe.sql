begin
  dbms_output.put_line('Let''s play a game of Tik Tac Toe');
  dbms_output.new_line();
   
  dbms_output.put_line(rpad('=',64,'='));
  dbms_output.put_line(rpad('=',64,'='));
  --5 bar box start
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  --number output
  dbms_output.put_line(rpad('||',10,' ')||'1'||rpad(' ',9,' ')||rpad('|',1,'|' )||rpad('|',10,' ')||'2'||rpad(' ',9,' ')||rpad('|',1,'|' )||rpad('|',10,' ')||'3'||rpad(' ',8,' ')||rpad('|',2,'|' ) );
  --box continued
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  --horizontal line breaks
  dbms_output.put_line(rpad(' ',20,'=')||rpad('',1,'')||rpad(' ',22,'=')||rpad('',1,'')||rpad(' ',21,'=') );
  --5 bar box cont
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',10,' ')||'4'||rpad(' ',9,' ')||rpad('|',1,'|' )||rpad('|',10,' ')||'5'||rpad(' ',9,' ')||rpad('|',1,'|' )||rpad('|',10,' ')||'6'||rpad(' ',8,' ')||rpad('|',2,'|' ) );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  
    --horizontal line breaks
  dbms_output.put_line(rpad(' ',20,'=')||rpad('',1,'')||rpad(' ',22,'=')||rpad('',1,'')||rpad(' ',21,'=') );
 
    --5 bar box cont
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',10,' ')||'7'||rpad(' ',9,' ')||rpad('|',1,'|' )||rpad('|',10,' ')||'8'||rpad(' ',9,' ')||rpad('|',1,'|' )||rpad('|',10,' ')||'9'||rpad(' ',8,' ')||rpad('|',2,'|' ) );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  dbms_output.put_line(rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ')||rpad('||',20,' ')||rpad('|',1,'|' )||rpad('|',20,' ') );
  
  
  --end
  dbms_output.put_line(rpad('=',64,'='));
  dbms_output.put_line(rpad('=',64,'='));
  

end;

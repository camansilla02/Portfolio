--fizz buzz
Declare
  x number(2);
Begin
 for x in 1 .. 100
   loop
     if remainder(x, 3) = 0 and remainder(x, 5) = 0   then
  --soo the remainder function works by taking the incoming loop dividing it by 3 and
  --rounding that to the nearest integer then it calculates x- (3* ni)
        dbms_output.put_line('FIZZBUZZ');
      elsif remainder(x, 5) = 0   and remainder(x, 3) <> 0 then dbms_output.put_line('BUZZ'); 
      elsif remainder(x, 3) = 0  and  remainder(x, 5) <> 0  then 
         dbms_output.put_line('FIZZ'); 
        else
          dbms_output.put_line(x);
         end if;
    end loop; 
End;

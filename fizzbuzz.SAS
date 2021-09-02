PROC IML;

/* FizzBuzz code goes here */
i=1;
do while(i<31);
if mod(i,15)=0 then;
	do;
	print("FizzBuzz");
	end;
else if mod(i,5)=0 then;
	do;
	print("Buzz");
	end;
else if mod(i,3)=0 then;
	do;
	print("Fizz");
	end;
else;
	do;
	print i;
	end;
i=i+1;
end;
QUIT;

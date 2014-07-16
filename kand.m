function [A] = kand(A,n) 
 
for I = 1:n^2
    if A(I)==0
	  spalte=idivide (int8(I-1), int8(n), 'floor'); %wegen I=n in der 0. spalte
	  spaltens=spalte*n+1;
	  spaltene=spaltens+n-1;
	  zeilens=mod(I,n);
           if mod(I,n) == 0
		zeilens=9;
	   end
           zeilene=zeilens+(n-1)*n;
           sub=zeros(1:(sqrt(n)-1)*2);
           
	%%%%%%%%%Oberezeile submatrix
	if 1==mod(I,sqrt(n))%erste zeile submatrix
		if mod(spalte,sqrt(n)) == 0 %linke spalte
		      for j=1:sqrt(n)-1
			  sub(j*2-1:j*2)=A(I+j*n+1:I+j*n+2);
		      end
		elseif mod(spalte,sqrt(n)) == sqrt(n)-1 %rechte spalte
		      for j=1:sqrt(n)-1
			  sub(j*2-1:j*2)=A(I-j*n+1:I-j*n+2);
		      end
		else
			In=zeilens+n*sqrt(n)*idivide (int8(I-1), int8(n*sqrt(n)), 'floor'); %zwischen spalte
			for j=0:sqrt(n)-2
				if j==spalte
					j=j+1;
				end
				sub((j+1)*2:(j+1)*2+1)=A(In+j*n+1:In+j*n+2);
			end
		end
	end
	%%%%%%%%%Oberezeile submatrix ENDE
	%%%%%%%%%Unterzeile submatrix
	if 0==mod(I,sqrt(n))%letzte zeile submatrix
		if mod(spalte,sqrt(n)) == 0 %linke spalte
		      for j=1:sqrt(n)-1
			  sub(j*2-1:j*2)=A(I+j*n-2:I+j*n-1);
		      end
		elseif mod(spalte,sqrt(n)) == sqrt(n)-1 %rechte spalte
		      for j=1:sqrt(n)-1
			  sub(j*2-1:j*2)=A(I-j*n-2:I-j*n-1);
		      end
		else
			In=zeilens+n*sqrt(n)*idivide (int8(I-1), int8(n*sqrt(n)), 'floor'); %zwischen spalte
			for j=0:sqrt(n)-2
				if mod(j,sqrt(n))==spalte
					j=j+1;
				end
				sub((j+1)*2:(j+1)*2+1)=A(In+j*n-2:In+j*n-1);
			end
		end
	end
	%%%%%%%%%Unterzeile submatrix ENDE

	    %Um eins nach hinten da bei sort eine führende null gibt
	B=sort(unique(cat(2, A(zeilens:n:n^2), A(spaltens:1:spaltene), sub(1:(sqrt(n)-1)*2))));
	%add = n-length(B); % auffüllen auf 8 einträge
	i=1;
	j=2;
	if length(B) == 1
		C=[1:n];
	else
		C=zeros(1,n);
		for k=1:n %%Kann man auch mit weniger itarationen machen. Dann braucht man sort wieder
		    if B(j)~=k
		      C(i)=k;
		      i=i+1;
		    elseif j<length(B)
		      j=j+1;
		    end
		end
	end
	
	%B=cat(2,B,zeros(1,add))
	A(I+n^2:n^2:(n+1)*n^2)=C;
           %A=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), A(1:3), A(10:12), A(19:21))))
    end
end
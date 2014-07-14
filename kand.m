function [] = kand(A,n) 
 
for I = 1:n^2
    if A(I)==0
	  spalte=idivide (int8(I-1), int8(n), 'floor');
	  spaltens=spalte*n+1;
	  spaltene=spaltens+n-1;
	  zeilens=mod(I,n);
           if mod(I,n) == 0
		zeilens=9;
	   end
           zeilene=zeilens+(n-1)*n;
           sub=zeros(1:(sqrt(n)-1)*2);
           
	if 0==mod(I,sqrt(n))%letzte zeile submatrix
		if mod(spalte,sqrt(n)) == 0 %rechte spalte
		      for j=1:sqrt(n)-1
			  I+j*n-2
			  I+j*n-1
			  sub(j*2:j*2+1)=A(I+j*n-2:I+j*n-1);
		      end
		elseif spalte == sqrt(n)-1 %linke spalte
		      for j=1:sqrt(n)-1
			  sub(j*2:j*2+1)=A(I-j*n-2:I-j*n-1);
		      end
		else
			In=zeilens; %zwishen
			for j=0:sqrt(n)-2
				if j==spalte
					j=j+1;
				end
				sub((j+1)*2:(j+1)*2+1)=A(In+j*n-2:In+j*n-1);
			end
		end
	end
      

           B=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), sub(1),sub(2),sub(3))))
           %A=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), A(1:3), A(10:12), A(19:21))))
    end
end
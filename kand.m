function [A] = kand(A,n) 
 
rtn=sqrt(n);

for I = 1:n^2
    if A(I)==0
	  spalte=idivide (int32(I-1), int32(n), 'floor'); %wegen I=n in der 0. spalte
	  spaltens=spalte*n+1;
	  spaltene=spaltens+n-1;
	  zeilens=mod(I,n);
           if mod(I,n) == 0
		zeilens=n;
	   end
           zeilene=zeilens+(n-1)*n;
           sub=zeros((rtn-1));
	if 1==mod(I,rtn) %%%Oberezeile submatrix
		if mod(spalte,rtn) == 0 %linke spalte
		      for j=1:rtn-1
			  sub(j*(rtn-1)-(rtn-2):j*(rtn-1))=A(I+j*n+1:I+j*n+(rtn-1));
		      end
		elseif mod(spalte,rtn) == rtn-1 %rechte spalte
		      for j=1:rtn-1
			  sub(j*(rtn-1)-(rtn-2):j*(rtn-1))=A(I-j*n+1:I-j*n+(rtn-1));
		      end
		else
			In=zeilens+n*rtn*idivide (int32(I-1), int32(n*rtn), 'floor'); %zwischen spalte
			j=0;
			jn=0;
			while j <= rtn-1
				if j==mod(spalte,rtn)
					j=j+1;
				end
				sub(jn*(rtn-1)+1:jn*(rtn-1)+(rtn-1))=A(In+j*n+1:In+j*n+(rtn-1));
				j=j+1;
				jn=jn+1;
			end
		end
	elseif 0==mod(I,rtn) %%%Unterzeile submatrix
		if mod(spalte,rtn) == 0 %linke spalte
		      for j=1:rtn-1
			  sub(j*(rtn-1)-(rtn-2):j*(rtn-1))=A(I+j*n-(rtn-1):I+j*n-1);
		      end
		elseif mod(spalte,rtn) == rtn-1 %rechte spalte
		      for j=1:rtn-1
			  sub(j*(rtn-1)-(rtn-2):j*(rtn-1))=A(I-j*n-(rtn-1):I-j*n-1);
		      end
		else
			In=zeilens+n*rtn*idivide (int32(I-1), int32(n*rtn), 'floor'); %zwischen spalte
			j=0;
			jn=0;
			while j <= rtn-1
				if j==mod(spalte,rtn)
					j=j+1;
				end
				sub(jn*(rtn-1)+1:jn*(rtn-1)+(rtn-1))=A(In+j*n-(rtn-1):In+j*n-1);
				j=j+1;
				jn=jn+1;
			end
		end
	else %%%Zwischenzeilen submatrix
		y=idivide (int32(zeilens-1), int32(rtn), 'floor');
		x=idivide (int32(spalte), int32(rtn), 'floor');
		offset=1+y*rtn+x*n*rtn;
		yj=0;
		yi=0;
		while yj<rtn-1
			xj=0;
			xi=0;
			if yj==mod(zeilens,rtn)-1
					yi=yi+1;
			end
			while xj<rtn-1
				if xj==mod(spalte,rtn)
					xi=xi+1;
				end
				sub(yj+1,xj+1)=A(offset+yi+xi*n)
				xj=xj+1;
				xi=xi+1;
			end
			yj=yj+1;
			yi=yi+1;
		end
	end
	    %Um eins nach hinten da bei sort eine führende null gibt
	B=sort(unique(cat(2, A(zeilens:n:n^2), A(spaltens:1:spaltene), sub(1:(rtn-1)^2))));
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
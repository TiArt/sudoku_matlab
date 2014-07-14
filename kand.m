function [] = kand(A) 
 
for I = 1:n^2
    if A(I)==0
	spalte=idivide (I n, "floor")
	spaltens=spalte*n+1
           spaltene=spaltens+n-1
           
           zeilens=mod(I,n)
           zeilene=zeilens+(n-1)*n
           
	if I==mod(I,sqrt(n))
		if mod(I,sqrt(n)) == 0
		      sub=zero(1:sqrt(n)-1)
		      for j=1:sqrt(n)-1
			  sub(j)=A(I+j*n-2:I+j*n-1)
		      end
		elseif mod(I,sqrt(n)) == sqrt(n)-1
		      sub=zero(1:sqrt(n)-1)
		      for j=1:sqrt(n)-1
			  sub(j)=A(I-j*n-2:I-j*n-1)
		      end
		else
			sub=zero(1:sqrt(n)-1)
			for j=0:sqrt(n)-2
				if j==spalte
					j=j+1
				end
				I=zeilens
				sub(j)=A(I-j*n-2:I-j*n-1)
			end
		end
	end
		      
      
           A=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), sub(1),sub(2),sub(3))
           %A=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), A(1:3), A(10:12), A(19:21))))
    end
end
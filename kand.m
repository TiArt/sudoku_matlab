function [] = kand(A) 
 
for I = 1:n^2
       if A(I)==0
           spaltens=idivide (I n, "floor")*n+1
           spaltene=spaltens+n-1
           
           zeilens=mod(I,n)
           zeilene=zeilens+(n-1)*n
           A=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), A(1:3), A(10:12), A(19:21))))
           A=sort(unique(cat(2, A(zeilens:9:81), A(spaltens:1:spaltene), A(1:3), A(10:12), A(19:21))))
       end
end
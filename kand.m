function [] = kand(A) 
 
for I = 1:n^2
       if A(I)==0
           spaltens=mod(I,n+1)
           spaltene=spaltens+n-1
           zeilens=mod(I,n)
           zeilene=zeilens+(n-1)*n
           sort(unique(cat(2, A(1:9:81), A(2:1:9), A(1:3), A(10:12), A(19:21))))
       end
end

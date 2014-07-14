function [] = soduku()
A=[
      3 9 0 0 0 0 0 6 8 ;
      7 0 0 0 6 0 3 0 0 ;
      0 0 5 0 2 3 0 9 0 ;
      0 4 1 0 3 0 0 7 5 ;
      8 3 0 0 0 0 0 4 9 ;
      9 5 0 0 1 0 6 2 0 ;
      0 1 0 5 7 0 9 0 0 ;
      0 0 9 0 8 0 0 0 1 ;
      5 7 0 0 0 0 0 8 4 ]

%  3*55

sqrt(length(A))
l=length(A);

for m=1: l
      for n=1: l
          if A(m,n)==0;
              b=m*n;
              an




             % sort(unique(cat(2, A(1:l:l^2), A(1:1:l),              )))
             % sort(unique(cat(2, A(1:9:81), A(2:1:9), A(1:3),
A(10:12), A(19:21))))





          end
      end
end

kand(A)
while neuerunde == 1
      for I = 1:n^2
          if A(I)==0
              if length(A(I:n^2:n^3)) == 1
                  A(I)=A(I+n^2)
              end
          end
      end
      kand(A)
end

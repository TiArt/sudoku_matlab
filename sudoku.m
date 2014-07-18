A=zeros(9,9,10);
N=load('sud');
n=length(N);
A(1:n^2)=N
kand(A,n)
%B=
%%%
while B~=A
    A=B;
    kand(A,n);
    %%%
end








%while neuerunde == 1
%      for I = 1:n^2
%          if A(I)==0
%              if length(A(I:n^2:n^3)) == 1
%                  A(I)=A(I+n^2)
%              end
%          end
%      end
%      kand(A)
%end

while 

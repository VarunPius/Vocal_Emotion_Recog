function X=to_row(A)
%%This Function converts input matrix to row matrix
[m,n]=size(A);
X=zeros(1,1);
for i=1:m
    X=[X A(i,:)];
end
X=X(1,2:(m*n)+1);
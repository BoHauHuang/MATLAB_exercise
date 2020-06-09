function [Ac] = cofactors(A)
[r,c]=size(A);
Ac=zeros(r,c);
for i=1:r
    temp=A;
    for j=1:c
        
        temp(i,:)=[];
        temp(:,j)=[];
        
        Ac(i,j)=(-1)^(i+j)*det(temp);
        temp=A;
    end
end
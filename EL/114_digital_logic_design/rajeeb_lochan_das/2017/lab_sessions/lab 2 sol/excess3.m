clc;
clear all;
deci1=input('');
deci2=input('');
b1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
b2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ans=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
i=16;
while deci1>0
    num=mod(deci1,10)+3;
    for j=i:-1:i-3
        b1(j)=mod(num,2);
        num=floor(num/2);
    end
    deci1=floor(deci1/10);
    i=i-4;
end
i=16;
while deci2>0
    num=mod(deci2,10)+3;
    for j=i:-1:i-3
        b2(j)=mod(num,2);
        num=floor(num/2);
    end
    deci2=floor(deci2/10);
    i=i-4;
end
carry=0;
t=0;
sum=0;
three=[0 0 1 1];
mthree=[1 1 0 1];
carry1=0;
for i=16:-4:4
    for j=i:-1:(i-3)
        t=b1(j)+b2(j)+carry;
    if t==0
        ans(j)=0;
        carry=0;
    end
    if t==1
        carry=0;
        ans(j)=1;
    end
    if t==2
        carry=1;
        ans(j)=0;
    end
    if t==3
        carry=1;
        ans(j)=1;
    end
    end

    if carry==1
    carry1=0;    
    for j=i:-1:i-3
        t=ans(j)+three(j+4-i)+carry1;
    if t==0
        ans(j)=0;
        carry1=0;
    end
    if t==1
        carry1=0;
        ans(j)=1;
    end
    if t==2
        carry1=1;
        ans(j)=0;
    end
    if t==3
        carry1=1;
        ans(j)=1;
    end
    end
    else
      carry1=0;    
    for j=i:-1:i-3
        t=ans(j)+mthree(j+4-i)+carry1;
    if t==0
        ans(j)=0;
        carry1=0;
    end
    if t==1
        carry1=0;
        ans(j)=1;
    end
    if t==2
        carry1=1;
        ans(j)=0;
    end
    if t==3
        carry1=1;
        ans(j)=1;
    end
    end  
    end
end
disp(ans);
for i=16:-4:4
sum=ans(i)+ans(i-1)*2+ans(i-2)*4+ans(i-3)*8;
if sum>12
    carry1=0;    
    for j=i:-1:i-3
        t=ans(j)+mthree(j+4-i)+carry1;
    if t==0
        ans(j)=0;
        carry1=0;
    end
    if t==1
        carry1=0;
        ans(j)=1;
    end
    if t==2
        carry1=1;
        ans(j)=0;
    end
    if t==3
        carry1=1;
        ans(j)=1;
    end
    end
end
end;
disp(ans);
final=0;
for i=4:4:16
    sum=ans(i)*1+ans(i-1)*2+ans(i-2)*4+ans(i-3)*8;
final=final*10+sum;
end
disp(final);
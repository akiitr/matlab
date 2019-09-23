function [ak,bk]=cheby2(n,ap,wc)
[AK,BK]=cheby1(3,3,0.5);
syms s;
dp=10^(-ap/20);
cp=2*tan(wc*pi/2);
e=(((dp^-2)-1)^(-2));
if(mod(n,2)==1)
    h=-1;
else
    h=1/sqrt(1+(e^2));
end
for k=1:n
    S(k)=cp*(((-sin((2*k-1)*pi/(2*n)))*sinh((1/n)*asinh(1/e)))+(1i*(cos((2*k-1)*pi/(2*n)))*cosh((1/n)*asinh(1/e))));
   h=(h*S(k))/(s-S(k));
end
syms z;
h=subs(h,s,2*(z-1)/(z+1));
h=simplify(h);
[num den]=numden(h);
ak=sym2poly(num);
bk=sym2poly(den);
ak=ak/bk(1);
bk=bk/bk(1);
ak=real(ak);
bk=real(bk);
ak=transpose(ak);
bk=transpose(bk);
end
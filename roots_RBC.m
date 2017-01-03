% structural shocks
sigmad=0.009;
sigmaz=0.0148;

% reduced form shocks
B=[0.48210906 -2.4029786; 0.96337089 -1.5619361];
vcv=B*[ sigmaz^2 0; 0 sigmad^2]*B';

% LHS transformation matrix
A0=[ 1 0; -0.77 1];

% AR(1) and MA(1) in reduced form equation (1)
AR1=[0.9413 1.0446; 0.0006 0.8045];
MA1=[-0.2498 -0.9173; -0.1924 -0.7065];
A0(2,1)=-AR1(2,2)/AR1(1,2);

% transform it into equation (2)
AR=A0*AR1;
MA=A0*MA1*inv(A0);
vcv=A0*vcv*A0';

% solve the AR(1) roots
coe2=AR(2,1);
coe1=AR(1,1)-A0(2,1)*AR(1,2);
coe0=-AR(1,2);
br=sqrt(coe1^2-4*coe2*coe0);
kap=[ (-coe1-br)/(2*coe2); (-coe1+br)/(2*coe2) ];

coe_n=zeros(size(kap));
coe_y=zeros(size(kap));
for i=1:length(kap)
    coe_n(i)=(AR(1,1)+AR(2,1)*kap(i))/(1+A0(2,1)*kap(i));
    coe_y(i)=AR(1,2)/kap(i);
end
    
% then solve for the MA(1) root
f=[ones(size(kap)) kap];    
g=MA(1,:);

newvcv=zeros(size(kap));
newcov=zeros(size(kap));
coe_MA=zeros(size(kap,1),2);

for i=1:length(kap)
    newvcv(i)=f(i,:)*vcv*f(i,:)'+g*vcv*g';
    newcov(i)=g*vcv*f(i,:)';
    gam=roots([1 newvcv(i)/newcov(i) 1]);
    coe_MA(i,:)=gam';
end

disp([ coe_n coe_y coe_MA]);

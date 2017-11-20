function result=growth(x,a)
F=@grow2;
dt=0.01;
interval=[0 10];
nstep=(interval(2)-interval(1))/dt;
sol1(1)=x;
figure(1);
if sol1(1)+F(sol1(1),a)*dt==0
    plot(interval(1),sol1(1),'r.','MarkerSize',10);
    sol1(1)=0.01;
end
hold on;
tt=linspace(interval(1),interval(2),nstep);
for ii=2:nstep
    sol1(ii)=sol1(ii-1)+F(sol1(ii-1),a)*dt;
    if abs(sol1(ii)-0.99)<0.0005
       result=tt(ii+1);
    end
end
plot(tt(2:(length(tt))),sol1(1:(length(sol1)-1)),'g.-');
end



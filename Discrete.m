function Discrete
dt=0.01;
interval=[0 10];
nstep=(interval(2)-interval(1))/dt;
xf2=0;   
A=[];
for a=0.01:0.01:4
    Xf=[];
    for jj=1:200
        sol1(1)=rand(1,1);
         if sol1(1)~=0
           for ii=2:nstep
               sol1(ii) = a*sol1(ii-1)*(1-sol1(ii-1));
               tt=linspace(interval(1),interval(2),nstep);
               
               if abs(xf2)<abs(sol1(ii))
                  xf2=sol1(ii);
               end
             %  xf=sol1(ii);
           end
       %        figure(2);
        %       plot(tt,sol1,'b-','MarkerSize',3);
         %      hold on;
          % hold off;
         else
            plot(interval(1),sol1(1),'r.','MarkerSize',10);
            sol1(1)=rand(1,1); 
        end
         Xf=[Xf,xf2];
    end
    A=[A;Xf];
end
aa=0.01:0.01:4;
for iii=1:200
    plot(aa,A(:,iii),'r.','MarkerSize',3)
    hold on;
end
end

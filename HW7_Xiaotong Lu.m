%HW7

% Problem 1: Modeling population growth
% The simplest model for a growing population assumes that each current
% individual has equal likelihood to divide, which yields a differential
% equation dx/dt = a*x where a is the division rate. It is easy to see that
% this will grow exponentially without bound. A simple modification is to
% assume that the growth rate slows done as the population reaches some
% maximum value N so that dx/dt = a*x*(1-x/N). Defining X = x/N, we have 
% dX/dt = a*X*(1-X).  
% Part 1. This equation has two fixed points at 0 and 1. Explain the
% meaning of these two points.
%Xiaotong Lu;
dt=0.01;
a=2;
interval=[0 10];
nstep=(interval(2)-interval(1))/dt;
sol1(1)=0;
figure(1);
if sol1(1)+grow2(sol1(1),a)*dt==0
    plot(interval(1),sol1(1),'r.','MarkerSize',10);
    sol1(1)=0.01;
end
hold on;    
for ii=2:nstep
    sol1(ii)=sol1(ii-1)+grow2(sol1(ii-1),a)*dt;
end
tt=linspace(interval(1),interval(2),nstep);
plot(tt(2:(length(tt))),sol1(1:(length(sol1)-1)),'g.-');%this plot curve should not contain the point(tt(1),so11(1)),because
%the point (0,0) has been plotted when the sol1(1)=0. So current sol1(1) should corresponds to tt(2).And tt(length(tt)) should correspond 
%to sol1(length(sol1)-1).
Comment:
In the point of 0, x is equal to 0, which means the polulation is 0. Then no mater what a or N is, the value of this equation will 
always be 0 because the population cannot increase.The number will always be 0. In the point of 1, x is equal to N, which means the has grown to the maxium number.
So the number of population cannot increase any more. Even we change a and N, the population cannot change any more.The value of the curve will 
fix on 1.

% Part 2: Evaluate the stability of these fixed points. Does it depend on
% the value of the parameter a?
 dt=0.01;
a=2;
interval=[0 10];
nstep=(interval(2)-interval(1))/dt;
sol1(1)=0;
figure(1);
if sol1(1)+grow2(sol1(1),a)*dt==0
    plot(interval(1),sol1(1),'r.','MarkerSize',10);
    sol1(1)=0.01;
end
hold on;    
for ii=2:nstep
    sol1(ii)=sol1(ii-1)+grow2(sol1(ii-1),a)*dt;
end
tt=linspace(interval(1),interval(2),nstep);
plot(tt(2:(length(tt))),sol1(1:(length(sol1)-1)),'g.-');

dt=0.01;
a=5;
interval=[0 10];
nstep=(interval(2)-interval(1))/dt;
sol1(1)=0;
figure(2);
if sol1(1)+grow2(sol1(1),a)*dt==0
    plot(interval(1),sol1(1),'r.','MarkerSize',10);
    sol1(1)=0.01;
end
hold on;    
for ii=2:nstep
    sol1(ii)=sol1(ii-1)+grow2(sol1(ii-1),a)*dt;
end
tt=linspace(interval(1),interval(2),nstep);
plot(tt(2:(length(tt))),sol1(1:(length(sol1)-1)),'g.-');

dt=0.01;
a=10;
interval=[0 10];
nstep=(interval(2)-interval(1))/dt;
sol1(1)=0;
figure(3);
if sol1(1)+grow2(sol1(1),a)*dt==0
    plot(interval(1),sol1(1),'r.','MarkerSize',10);
    sol1(1)=0.01;
end
hold on;    
for ii=2:nstep
    sol1(ii)=sol1(ii-1)+grow2(sol1(ii-1),a)*dt;
end
tt=linspace(interval(1),interval(2),nstep);
plot(tt(2:(length(tt))),sol1(1:(length(sol1)-1)),'g.-');

Comment: The fixed point will not change corresponding to the variation of a which are 0 and 1. But the slope will be affected
by the value of a. When the a is growing up, the slope will increase too and the curve will be more steep.

% Part 3: Write a function that takes two inputs - the initial condition x0
% and the a parameter and integrates the equation forward in time. Make
% your code return two variables - the timecourse of X and the time
% required for the population to reach 99% of its maximum value. 
time=growth(0.1,2);

% Part 4: Another possible model is to consider generations
% instead allowing the population to vary continuously. e.g. X(t+1) = a*
% X(t)*(1-X(t)). Consider this model and vary the a parameter in the range 0
% < a <= 4. For each value of a choose 200 random starting points  0 < x0 < 1 
% and iterate the equation forward to steady state. For each final
% value Xf, plot the point in the plane (a,Xf) so that at the end you will
% have produced a bifucation diagram showing all possible final values of
% Xf at each value of a. Explain your results. 

Discrete;%I define a function named Discrete and use the model from problem1.4 and 1.1 together to generate this diagram.




% Problem 2. Genetic toggle switches. 
% Consider a genetic system of two genes A and B in which each gene
% product represses the expression of the other. Make the following
% assumptions: 
% a. Repression is cooperative:  each promotor region of one gene has 4
% binding sites for the other protein and that all of these need to be
% occupied for the gene to be repressed. 
% b. You can ignore the intermediate mRNA production so that the product of
% the synthesis of one gene can be assumed to directly repress the other
% c. the system is prefectly symmetric so that the degradation
% times, binding strengths etc are the same for both genes. 
% d. You can choose time and concentration scales so that all Michaelis
% binding constants and degradation times are equal to 1. 
%
% Part 1. Write down a two equation model (one for each gene product) for
% this system. Your model should have one free parameter corresponding to the
% maximum rate of expression of the gene, call it V. 
%Xiaotong Lu
figure(1);%equation 1
V=3;
ku1=0;
x=0:0.1:8;
gx=(ku1+V*x.^4)./(1+x.^4)-x;
plot(x,gx,'LineWidth',3);
hold on;
plot([0 8],[0 0],'k','LineWidth',3); hold off;
set(gca,'FontSize',24)
figure(2);%equation 2
V=5;
ku2=2;
x=0:0.1:8;
gx=(ku2+V*x.^4)./(1+x.^4)-x;
plot(x,gx,'LineWidth',3);
hold on;
plot([0 8],[0 0],'k','LineWidth',3); hold off;
%
% Part 2. Write code to integrate your model in time and plot the results for V = 5 for two cases, 
% one in which A0 > B0 and one in which B0 > A0. 
%Xiaotong Lu
figure(3);
V=5;
ku1=0;
ku2=2;
A0=0.1;B0=0.9;
rhs1=@(t,x) (ku1+V*x.^4)./(1+x.^4)-x;
rhs2=@(t,x) (ku2+V*x.^4)./(1+x.^4)-x;
sol1=ode23(rhs1,[0 8],A0);
sol2=ode23(rhs2,[0 8],B0);
plot(sol1.x,sol1.y,'r.-','LineWidth',2,'MarkerSize',10);
xlabel('Time');
ylabel('Expression');
set(gca,'FontSize',24);
hold on;
plot(sol2.x,sol2.y,'g.-','LineWidth',2,'MarkerSize',10);

figure(4);
V=5;
ku1=0;
ku2=2;
A0=0.9;B0=0.1;
rhs1=@(t,x) (ku1+V*x.^4)./(1+x.^4)-x;
rhs2=@(t,x) (ku2+V*x.^4)./(1+x.^4)-x;
sol1=ode23(rhs1,[0 8],A0);
sol2=ode23(rhs2,[0 8],B0);
plot(sol1.x,sol1.y,'r.-','LineWidth',2,'MarkerSize',10);
xlabel('Time');
ylabel('Expression');
set(gca,'FontSize',24);
hold on;
plot(sol2.x,sol2.y,'g.-','LineWidth',2,'MarkerSize',10);


% Part 3. By any means you want, write code to produce a bifurcation diagram showing all
% fixed points of the system as a function of the V parameter. 
%Xiaotong Lu
ku1=0;
ku2=2;
figure(5);
hold on;
rhs1=@(x,V) (ku1+V*x.^4)./(1+x.^4)-x;
rhs2=@(x,V) (ku2+V*x.^4)./(1+x.^4)-x;
for V=0:0.5:5
    gxfunc1=@(x) rhs1(x,V);
    gxfunc2=@(x) rhs2(x,V);
    for x0=0:0.1:8
        [rt1,~,exitflag1]=fzero(gxfunc1,x0);
        [rt2,~,exitflag2]=fzero(gxfunc2,x0);
        if exitflag1==1
            plot(V,rt1,'r.','MarkerSize',15)
        end
        hold on;
            if exitflag2==1
            plot(V,rt2,'g.','MarkerSize',15)
            end
    end
end

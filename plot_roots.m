%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%          simulate the structural parameters from the RBC model          %
%          then calculate the AR(1) and MA(1) roots in the VARMA          %
%          representation of the true DGP to examine cancelation          %
%                                                                         %
%     generate figures using the simulation results obtained in GAUSS     %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              --- written by Wenying Yao, 15 August 2014 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
tic;    %% start the timer

%% import data
cd 'C:\Users\wenyingy\Dropbox\April.2013.and.bofore\RBCpaper\codes'

disp(' ');
disp(' ------------------------------------------- ');
disp(' Starting importing the AR and MA roots .... '); 
disp(' ------------------------------------------- ');
start_time = clock;

format long
simroots=dlmread('simroots.asc');

disp( ['data import takes '  num2str( etime( clock, start_time) ) ' seconds' ] );
disp(' ');

x=linspace(0,1,1001);
y=x;
rho=nan(length(x),length(x));
z1=nan(size(x));
z2=nan(size(x));

for i=1:length(x);
    phi=x(i);
    for j=1:length(y);
        theta=y(j);
        rho(i,j)=((phi-theta)*(1-phi*theta))/(1+theta^2-2*phi*theta);
    end
    
    if i>=140
        z1(i)=max(y(rho(i,:)>1.96/sqrt(200)));
    end
    
    if i<724
        z2(i)=min(y(rho(i,:)<-1.96/sqrt(200)));
    end
end


%% generate scatter plot
arcoe=simroots(:,end-1);
macoe=simroots(:,end);

figure1 = figure;
set(figure1, 'Position', [100, 100, 800, 800]);
set(gca,'YGrid','on','XGrid','on','FontSize',16);
xlim([0,1]);
ylim([0,1]);
box on
hold all

scatter(arcoe(1:10000),macoe(1:10000),'.k');

line([0,1],[0,1], 'LineWidth',3, 'color',[1 0 0]);
plot(x,z1, 'LineWidth',3, 'color',[0 0 1], 'LineStyle', '--');
plot(x,z2, 'LineWidth',3, 'color',[0 0 1], 'LineStyle', '--');

xlabel('AR(1) coefficient','FontSize', 16);
ylabel('MA(1) coefficient','FontSize', 16);

%% plot the distribution of rhod
figure1 = figure;
set(figure1, 'Position', [100, 100, 850, 350]);
hold all

rhod=simroots(:,6); % rho_d is the sixth parameter

nbin=200;

hist(rhod,nbin);

h = findobj(gca,'Type','patch');
set(h,'FaceColor','b','EdgeColor','b');

xlabel('\rho_d','FontSize', 16);

toc
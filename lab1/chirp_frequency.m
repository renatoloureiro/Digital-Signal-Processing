color1=[0 0.4470 0.7410];
color2=[0.6350 0.0780 0.1840];
color3=[0.4660 0.6740 0.1880];
color4=[0.8500 0.3250 0.0980];
lw=2;

t=0:0.005:2;
f=t.^2; %[MHz]

h=figure(1);
plot(t,f,'Color',color4,'LineWidth',lw);
xlabel("Tempo [s]")
ylabel("Frequência [MHz]")
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches',...
'PaperSize',[pos(3), pos(4)]);
name='chirp_frequency';
print(h,[pwd join(['/Img/',name])],'-dpdf','-r0');
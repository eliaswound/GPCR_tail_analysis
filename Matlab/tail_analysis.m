% tail='DENFKACFRKFCCASALRRDVQVSDRVRSIAKDVALACKTSETVPRPA';
% N is how many of the GPCRs to analyze%% 
% tailseqall is a cell containing the tail sequences%%

N=300;smatrix=[];

for i = 1:N
L=[];serines=[];single_S=0;all_S=[]
tail=tailseqall{0+i,1};
L=length (tail);

serines=strfind(tail, 'S');
all_S=length(serines);

t = diff(serines) == 1;
y = [t,false];
x = xor(y,[false,t]);
test=x|y;
single_S=length(find(test==0));


% if all_S>1 
% for j=1:all_S
%     if  tail(serines(j)-1)~='S' & tail(serines(j)+1)~='S';
%         single_S=single_S+1;
%     end
% end
% end
% dserines=diff(serines);
% multiple_S=length(find(dserines==1)+1);


outpt=zeros(1,L);
outpt(serines)=1;
smatrix(i,1:3)=[L,all_S,single_S];
subplot(N,1,i);
imagesc(1,1:L,outpt);
set(gca,'YTick',[],'XTick',[])
set(gca, 'visible', 'off');
end


colormap(hot)
% colormap(summer(64))
% colorbar

% set(gca, 'XAxisLocation','top', 'XTick',tick, 'YTick',tick)
% axis square
% xlabel('Last Digit of Team A''s Score')
% ylabel('Last Digit of Team B''s Score')

per=smatrix(:,2)./smatrix(:,1);
figure;hist(per(find(per<0.4)),30)
function [hM] = plotErrorBar(MeanValues,StdErr,frontcolor,backcolor)
%%PLOTERRORBAR Plot one or several lines with shadded error bars

if ~exist('frontcolor','var')
  frontcolor = [0 0 1; 0 1 0; 1 0 0; 1 1  0; 0 1 1; 1 0 1];
end
if ~exist('backcolor','var')
  backcolor = [0.7 0.7 1; 0.7 1 0.7; 1 0.7 0.7; 1 1 0.7; 0.7 1 1; 1 0.7 1];
end

nblines = size(MeanValues,1);
len = size(MeanValues,2);

if (size(StdErr,1)~=nblines)
  error('The arguments are not compatible \n');
end
if (size(StdErr,2)~=len)
  error('The arguments are not compatible \n');
end

holdStatus=ishold;
if ~holdStatus, hold on,  end

for i=1:nblines
  plot(MeanValues(i,:)+StdErr(i,1:len),'Color',backcolor(i,:),'LineWidth',1.0,'LineStyle','--');
  plot(MeanValues(i,:)-StdErr(i,1:len),'Color',backcolor(i,:),'LineWidth',1.0,'LineStyle','--');
end

for i=1:nblines
  hS(i)=fill([1:len len:-1:1],[MeanValues(i,1:len)+StdErr(i,1:len) MeanValues(i,len:-1:1)-StdErr(i,len:-1:1)],backcolor(i,:),'EdgeColor',backcolor(i,:));%,'EdgeAlpha',0,'FaceAlpha',0.3);
end

for i=1:nblines
  hM(i)=plot(MeanValues(i,:),'Color',frontcolor(i,:),'LineWidth',2);
end

if ~holdStatus, hold off, end

end
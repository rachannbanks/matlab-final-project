function KeepScore()
%create a text box and update it to keep score

cVal=0;
%position is [left bottom width height]
score=uicontrol('Style','edit','BackgroundColor', [1 0 0],'Units','Normalized','Position',...
    [0.7 0.9 0.3 0.1],'FontSize',30,'String',cVal);

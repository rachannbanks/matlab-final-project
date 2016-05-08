function lose = GameOver(lose)
%this gets called if you lose the game

if lose==1
    str='That is a wall';
elseif lose==2
    str='You ran into yourself';
end

lose=uicontrol('Style', 'text', 'BackgroundColor', [0.5 0 0.5], 'Units', 'Normalized', 'Position', ...
    [0.3 0.3 0.3 0.3], 'Fontsize', 40, 'String', str);
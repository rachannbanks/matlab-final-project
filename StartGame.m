function StartGame()

ss = get(0,'ScreenSize');
fig = figure('Position',ss.*.5);
movegui(fig,'center');

start=uicontrol('Style', 'pushbutton', 'BackgroundColor', [0.5 0 0.5], 'Units', 'Normalized',...
    'Position', [0.3 0.3 0.3 0.3], 'Fontsize', 40, 'String', 'Start',...
    'Callback', @LetsStart);

%callback function for push button
    function LetsStart(~,~)
        disp('start game');
        GameLoop();
        %need to make this call my main loop
    end
end

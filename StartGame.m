function StartGame()

ss = get(0,'ScreenSize');
fig = figure('Position',ss.*.5);
fig.Visible = 'off';
movegui(fig,'center');
fig.Visible= 'on';

%new version-make different difficulties
%easy-slow, less points
%medium-faster, more points
%hard-fast, lots of points
snake=uicontrol('Style', 'text','Units', 'Normalized','Position',... 
    [0.25 0.8 0.55 0.15], 'ForegroundColor', [0.5 0.2 0.2],'Fontsize', 50,...
    'FontWeight','bold','FontAngle', 'italic', 'String', 'Snake');

choose=uicontrol('Style', 'text', 'Units', 'Normalized','Position',...
    [0.28 0.63 0.55 0.15], 'Fontsize', 30,'String', 'Choose your difficulty');

easy=uicontrol('Style', 'pushbutton', 'BackgroundColor', [0.5 0 0.5],...
    'Units', 'Normalized','Position', [0.1 0.35 0.25 0.3], 'Fontsize', 40,...
    'String', 'EASY', 'Callback', @EasyGame);

medium=uicontrol('Style', 'pushbutton', 'BackgroundColor', [0.5 0 0.5],...
    'Units', 'Normalized','Position', [0.37 0.35 0.25 0.3], 'Fontsize', 40,...
    'String', 'MEDIUM', 'Callback', @MediumGame);

hard=uicontrol('Style', 'pushbutton', 'BackgroundColor', [0.5 0 0.5],...
    'Units', 'Normalized','Position', [0.64 0.35 0.25 0.3], 'Fontsize', 40,...
    'String', 'HARD', 'Callback', @HardGame);

%set  up time and points that will be changed depending on difficulty
timestep=0;
points=0;

    function EasyGame(~,~)
        disp('easy game');
        timestep=0.2;
        points=5;
        GameLoop(timestep,points);
        
    end
    function MediumGame(~,~)
        disp('medium game');
        timestep=0.15;
        points=10;
        GameLoop(timestep,points);
        
    end
    function HardGame(~,~)
        disp('hard game');
        timestep=0.1;
        points=20;
        GameLoop(timestep,points);
        
    end
end

% start=uicontrol('Style', 'pushbutton', 'BackgroundColor', [0.5 0 0.5], 'Units', 'Normalized',...
%     'Position', [0.35 0.35 0.3 0.3], 'Fontsize', 40, 'String', 'Start',...
%     'Callback', @LetsStart);
% 
% %callback function for push button
%     function LetsStart(~,~)
%         disp('start game');
%         GameLoop();
%         %need to make this call my main loop
%     end
% end

%main loop-updates everything in the game 

i=0;
ss = get(0,'ScreenSize');
fig = figure('Position',ss.*.5);
axes=gca;
movegui(fig,'center');
snake=plot(0,0,'gs', 'MarkerSize',50, 'MarkerFaceColor', [0 1 0]);
axis off;
boardsz=9;
axis([-boardsz boardsz -boardsz boardsz]);
hold on;
dot=GenerateDot(boardsz);
%set up score
score=0;
KeepScore(score);
%create empty arrays to put the velocities in
% xvelocity=[];
% yvelocity=[];
%lastkeypressed = 0;
%fig.KeyPressFcn= @KeyboardControls;
%initialize velocities of snake
currentyxvel=0;
currentyvel=0;
newxvelocity=0;
newyvelocity=0;
while true
   
    key=0;

    %now ChangeVelocity only changes the x and y velocity
    [newxvelocity, newyvelocity, key] = ChangeVelocity(fig, snake, dot, boardsz, currentxvel, currentyvel);
    %if no key is pressed key == 0
    if key == 0
        %continue with same velocity if no key is pressed
        newxvelocity=currentxvel;
        newyvelocity=currentyvel;
    elseif key == 1
        currentxvel=newxvelocity;
        currentyvel=newyvelocity;
    end
    %after changing values of newx and newy velocities, give to updatesnake
    [newX, newY]=UpdateSnake(snake, newxvelocity, newyvelocity);
    %after updatesnake call collision check
    [collision, score]=CollisionCheck(boardsz, snake, newX, newY, dot, score);
   
    %collision check calls update dot and lengthens snake as needed
    %collision==1 if a collision with wall or self happens
    %if there was a collision, break from the loop
    if collision == 1
        disp('break');
        break;
    end
    %update snake velocity based on keyboard control
  %  disp(xvelocity);
    %update snake position
        %draw position
        %if collide with wall-break
        %if collide with self-break
        %if eat dot-add legnth
            %create new dot
    %add point to counter
    %pause
    %pause(0.5);
    %i=i+1;
end
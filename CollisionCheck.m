function [collision, score, lost] = CollisionCheck(boardsz, snake, newX, newY, dot,score, scorekeeper)
%this function checks for any of the following three instances
%1-if the snake hits a wall
%2-if the snake hits itself
%3-if the snake eats a dot
%collision returns zero if doesn't hit wall or self, one otherwise
%needs to get called after plotsnake
currentX=snake.XData;
currentY=snake.YData;
collision=0;
nlinks=length(newX)-1; %current size of snake
%round dot position to whole numbers
dotx=dot.XData;
doty=dot.YData;
roundX=round(dotx);
roundY=round(doty);
%1-check if snake hits a wall
lose=0; %will be changed to one or two if you lose
lost=0;
if any(newX == -boardsz) || any(newX == boardsz)
    disp('end game');
    collision=1;
    lose=1;
    %make text box saying you lost
    lost = GameOver(lose);
    return;
elseif any(newY == -boardsz) || any(newY == boardsz)
    disp('end game');
    collision=1;
    lose=1;
    %make text bot saying you lost
    lost = GameOver(lose);
    return;
end

%2-check if snake hits itself-only need to check first link
firstX=newX(1);
firstY=newY(1);

%check if any of the links have the same coordinates as the new first link
if nlinks > 1
    for i=2:nlinks
        if newX(i) == firstX
            if newY(i) == firstY
                collision=1;
                lose=2;
                %make text box saying you lost
                lost = GameOver(lose);
            end
        end
    end
end

%if you lost

%3-check if snake eats dot
%initialize eat variable
eat=0; %will be changed to one if snake eats
%check if first link eats the dot
%if moving horizontally-if passes dot and dot is between y coordinates
%new version-check if coordinates equal the dot coordinates
if (firstX-0.6)<=dotx && (firstX+0.6)>= dotx
    if (firstY-0.6) <= doty && (firstY+0.6) >= doty
        eat=1;
        %add score
        score=score+10;
        %update displayed score
        set(scorekeeper, 'String', score);
    end
end

%if eat variable is unchanged shorten the snake and plot it
if eat == 0;
    %make position arrays the same length as the number of links
    newX=newX(1:nlinks);
    newY=newY(1:nlinks);
    %update snake plot if snake does not eat
    snake.XData=newX;
    snake.YData=newY;
elseif eat == 1
    %if dot is eaten create new dot
    UpdateDot(boardsz, dot, newX, newY);
    %lengthen snake
    snake.XData=newX;
    snake.YData=newY;
end


function [newxvelocity, newyvelocity, key, collision] = ChangeVelocity(fig, snake, dot, boardsz, currentxvel, currentyvel, key)
%change velocity of ball depending on keyboard controls
%key returns one if a key was pressed, zero otherwise
%collision returns one if there is a collsion, zero otherwise
%create figure
%hi
fig.KeyPressFcn= @KeyboardControls;
%callback function
newxvelocity=0;
newyvelocity=0;
currentX=snake.XData;
currentY=snake.YData;
newX=[ currentX(1) currentX]; %array of current x values
newY=[ currentY(1) currentY]; %array of current y values
snakelength=size(snake.XData);
nlinks=snakelength(2); %length of snake
%round dot position to whole numbers
dotx=dot.XData;
doty=dot.YData;
roundX=round(dotx);
roundY=round(doty);
%set up eat variable
eat=0;
%set up variable to see if the key is pressed
key=0;
collision=0;
pause(0.2);
%initialize variable for collision check
    function KeyboardControls(~,eventdata)
        %change velocity of first link with keyboard
        key=1;
        switch eventdata.Key
            case 'uparrow'
                newyvelocity=1;
                key=1;
                %newxvelocity=0;
                plotsnake;
            case 'downarrow'
                newyvelocity= -1;
                key=1;
                %newxvelocity=0;
                plotsnake;
            case 'rightarrow'
                newxvelocity= 1;
                key=1;
                %newyveloctiy=0;
                plotsnake;
            case 'leftarrow'
                newxvelocity= -1;
                key=1;
                %newyvelocity=0;
                plotsnake;
            
        end 
       

        %plotsnake();
    end
%if no button is pressed
% if key ~= 1
%     %new velocities = current velocities
%     newxvelocity=currentxvel;
%     newyvelocity=currentyvel;
%     plotsnake;
% end
%new snake coordinates based on veloctiy
%need to make this work for multiple links
%need to make velocities vectors for each link??
    function plotsnake()
        %place where the first link turns
%         turnX=currentX(1);
%         turnY=currentY(1);
        %arrays to put the new position values
        %newX=zeros(1, nlinks);
        %newY=zeros(1, nlinks);
        %update velocity arrays
%         xvelocity= [xvelocity newxvelocity];
%         xvelocity= xvelocity(1:end-1);
%         yvelocity= [yvelocity newyvelocity];
%         yvelocity= yvelocity(1:end-1);
        %change position of first link
%         firstX=currentX(1) + newxvelocity;
%         firstY=currentY(1) + newyvelocity;
        %add new first position and move up position of all other links
        newX(1)=currentX(1) + newxvelocity;
        newY(1)=currentY(1) + newyvelocity;
        %snake.XData=newX;
        %snake.YData=newY;
        
        %make these the new snake positions
%         snake.XData=newX;
%         snake.YData=newY;
%         snake.XData=currentX+ xvelocity;
%         newX=snake.XData;
%         snake.YData=currentY+ yvelocity;
%         newY=snake.YData;
        CollisionCheck()
        %drawnow;
    end
    function CollisionCheck()
        collision=0;
        %check if snake hit the walls
        if any(snake.XData == -6) || any(snake.XData == 6)
            disp('end game');
            collision=1
            return;
        elseif any(snake.YData == -6) || any(snake.YData == 6)
            disp('end game');
            collision=1
            return;
        end
        %check if eat dot
        %need to check if any link eats the dot
        eat=1; 
        %if eat is changed the snake ate a dot
        for i=1:nlinks
            if currentX(i) < dotx && newX(i) > dotx
                if currentY(i) == roundY
                    disp('eat');
                    eat= 2;
                    UpdateDot();
                    break;
                end
            
            elseif currentX(i) > dotx && newX(i) < dotx
                if currentY(i) == roundY
                    disp('eat');
                    eat=2;
                    UpdateDot();                  
                    break;
                end
            
            elseif currentY(i) < doty && newY(i) > doty
                if currentX(i) == roundX
                    disp('eat');
                    eat=2;
                    UpdateDot();
                    break;
                end
            
            elseif currentY(i) > doty && newY(i) < doty
                if currentX(i) == roundX
                    disp('eat');
                    eat=2;
                    UpdateDot();
                    break;
                end
                
            end
        end
        %if eat variable is unchanged shorten the snake and plot it
        if eat == 1
            %make position arrays the same length as the number of links
            newX=newX(1:nlinks);
            newY=newY(1:nlinks);
            snake.XData=newX;
            snake.YData=newY;
        end

    
        %if it doesn't eat dot then it gets here 
        %make position arrays one shorter
%         newX=newX(1:end-1);
%         newY=newY(1:end-1);
        %update these to snake position
        %snake.XData=newX;
        %snake.YData=newY;
    end
    function UpdateDot()
        dot.XData= (boardsz-1)*2*rand()-(boardsz-1);
        dot.YData= (boardsz-1)*2*rand()-(boardsz-1);
        LengthenSnake();
    end
    function LengthenSnake()
        %add a link to the snake
        %keep position arrays one longer, make these snake data
        snake.XData=newX;
        snake.YData=newY;
%         disp('length snake');
%         disp(newX);
%         disp(newY);


        %if the snake is lenghtened it will return to main loop here
        return;
        %if moving left/right, add another link horizontally
        %also need to lengthen velocity arrays
%         if newxvelocity ~= 0
%             snake.XData=[newX newX(end)-newxvelocity];
%             snake.YData=[newY newY(end)];
        %if moving up/down, add another link vertically    
%         else 
%             snake.XData=[newX newX(end)];
%             snake.YData=[newY newY(end)-newyvelocity];
%         end
    end
%if snake didn't eat anything make position arrays one shorter
% if eat == 1
%     disp('got here');
%     newX=newX(1:end-1);
%     newY=newY(1:end-1);
%     snake.XData=newX;
%     snake.YData=newY;
% end
%

    
end


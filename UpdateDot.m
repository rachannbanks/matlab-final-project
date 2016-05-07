function UpdateDot(boardsz, dot, newX, newY)
%create new dot when dot is eaten, gets called by Collision Check
dot.XData= (boardsz-1)*2*rand()-(boardsz-1);
dot.YData= (boardsz-1)*2*rand()-(boardsz-1);
for i = 1:length(newX)
    if newX(i) == dot.XData
        if newY(i) == dot.YData
            UpdateDot(boardsz,dot,newY, newY)
            break;
        end
    end
end
%LengthenSnake();
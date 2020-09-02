u(FreeNodes)=x;
hold off
trisurf(Elements3,Coordinates(:,1),Coordinates(:,2),u');
hold on
trisurf(Elements4,Coordinates(:,1),Coordinates(:,2),u');
view(-67.5,30);
title('Solution of the Problem')
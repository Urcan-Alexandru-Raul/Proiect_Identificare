t = Urcan(:,1); % timp
u = Urcan(:,2); % intrarea
y1 = Urcan(:,3); % iesirea 1
y2 = Urcan(:,4); % iesirea 2
% figure; plot(t,u,t,y1);
% figure; plot(t,u,t,y2);
dt = t(2) - t(1); % pasul de achizitie
d_id1 = iddata(y1,u,dt);

Marx1 = arx(d_id1,[2,2,1]);

Hz1 = tf(Marx1.B,Marx1.A,dt);
 resid(d_id1,Marx1,5)
%compare(d_id1,Marx1)
Hs1 = d2c(Hz1, 'zoh')

Marmax1 = armax(d_id1,[2,2,2,1]);
% resid(d_id1,Marmax1,5)
% figure; compare(d_id1,Marx1,Marmax1)

Mvi1 = iv4(d_id1,[2,2,1]);                        % variabile instrumentale
% resid(d_id1,Mvi1,5);
% figure; compare(d_id1,Marx1,Marmax1,Mvi1);

Moe1 = oe(d_id1,[2,2,1]);                         % output error
% resid(d_id1,Moe1,5);
 figure; compare(d_id1,Marx1,Marmax1,Mvi1,Moe1);

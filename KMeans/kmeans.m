%INPUT: X: INPUT DATA; K: NUMBER OF CLUSTER CENTERS; NC: INITIAL CLUSTER
%CENTERS
%OUTPUT: JDATA: TOTAL DISTORTION; CID: CLUSTER CENTER ID; NR: NUMBER OF
%EACH CLUSTER; CENTERS: CLUSTER CENTER
function [jdata,cid,nr,centers] = kmeans(x,k,nc)
[n,d] = size(x);
%CID: CLUSTER CENTER MATRIX 
cid = zeros(1,n); 
oldcid = ones(1,n);
%NR: NUMBER OF EACH CLUSTER MATRIX
nr = zeros(1,k);
%JDATA: TOTAL DISTORTION MATRIX
jdata=[];
numb=1;
temptt=0;

%MAX ITERATION TIMES
maxgn= 1000;
iter = 1;
while iter < maxgn
temptt=0;
%CACULATE EVERY DATA TO EVERY CENTER, CHOOSE THE MINMUM VALUE (TO CID)AS ITS CENTER
for i = 1:n
%CACULATE EVERY DATA TO EVERY CENTER
dist = sum((repmat(x(i,:),k,1)-nc).^2,2);
%CHOOSE THE MINMUM VALUE (TO CID)AS ITS CENTER
[m,ind] = min(dist);
%STORE THE DISTORTION
temptt=temptt+m;

cid(i) = ind;
end
%JUMP OUT THE LOOP WHEN THE TOTAL DISTORTION REMAINS STABLE
jdata(numb)=temptt;
numb=numb+1;
if numb>3
if temptt==jdata(numb-2)
    break;
end
end

%FOR EACH CLUSTER, FIND EVERY DATA BELONGS TO IT
for i = 1:k

ind = find(cid==i);
%CACULATE THE AVERAAGE AS ITS CENTER
nc(i,:) = mean(x(ind,:));

nr(i) = length(ind);
end
iter = iter + 1;
end

% Now check each observation to see if the error can be minimized some more. 
% Loop through all points.
maxiter = 2;
iter = 1;
move = 1;
%j~=k: RETURN 1 IF MAXITER!=MOVE, 0 OTHERWISE
while iter < maxiter & move ~= 0 
move = 0;
%FIND THE BEST CLUSTER AGAIN
for i = 1:n
dist = sum((repmat(x(i,:),k,1)-nc).^2,2);
r = cid(i); 
%NR, THE NUMBER OF DATA FOR EACH CLUSTER
dadj = nr./(nr+1).*dist'; %AJUST DISTANCE
%FINE OUT WHICH IS THE CLOEST CENTER
[m,ind] = min(dadj);
%IF NOT THE SAME, THEN CHANGE THE CENTER
if ind ~= r 
  cid(i) = ind;%NEW CENTER RESULT TO CID 
  ic = find(cid == ind);%RECACULATE THE DISTANCE
  nc(ind,:) = mean(x(ic,:));
  move = 1;
end
end
iter = iter+1;
end
centers = nc;

%plot(distortion,'r');
end 

k=4;
x = load ('GMD.dat');
[n,d] = size(x);
bn=round(n/k*rand);
nc=[x(bn,:);x(2*bn,:);x(3*bn,:);x(4*bn,:)];

[jdata,cid,nr,centers] = kmeans(x,k,nc);
%FIGURE 1 SHOW TEH TOTAL DISTORTION 
figure(1)
plot(1:length(jdata),jdata);
figure(2);
%PLOT SAMPLE IN DIFFERENT COLORS FOR DIFFERENT CLUSTER
for i=1:1000,
  if cid(i)==1,
    plot(x(i,1),x(i,2),'r*') ;
    hold on
  else
  if cid(i)==2,
      plot(x(i,1),x(i,2),'b*') ;
      hold on
  else
      if cid(i)==3,
        plot(x(i,1),x(i,2),'g*') ;
        hold on
      else
          if cid(i)==4,
        plot(x(i,1),x(i,2),'k*') ;
        hold on
          end
      end
  end
  end
end

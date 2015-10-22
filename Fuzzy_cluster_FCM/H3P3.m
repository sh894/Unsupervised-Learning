 data = load ('GMD.dat'); 
 %options = [2;100;1e-5;1]; 
 options = [2;100;1e-5;1]; 
 [center,U,obj_fcn] = FCMClust(data,4,options); 
 figure; 
  plot(data(:,1), data(:,2),'o'); 
%  title('DemoTest of FCM Cluster'); 
%  xlabel('1st Dimension'); 
%  ylabel('2nd Dimension'); 
 grid on; 
 hold on; 
 maxU = max(U); 
 index1 = find(U(1,:) == maxU); 
 index2 = find(U(2,:) == maxU);
 index3 = find(U(3,:) == maxU); 
 index4 = find(U(4,:) == maxU);
 line(data(index1,1),data(index1,2),'marker','*','color','g'); 
 line(data(index2,1),data(index2,2),'marker','*','color','r'); 
 line(data(index3,1),data(index3,2),'marker','*','color','y'); 
 line(data(index4,1),data(index4,2),'marker','*','color','b');
 plot(
 %  plot([center([1 2],1)],[center([1 2],2)],'*','color','k') 
 
 hold off; 


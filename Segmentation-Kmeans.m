
srcFile=dir('/Users/...');

for num=1
       
         
    filename=strcat('/Users/...',srcFile(num).name);
    I=imread(filename);
    
v= 1;        
k=6;

%% pre-processing

bw = imbinarize(I,0.1);

props=regionprops(bw);
areamatrix=cat(1,props.Area);

[~,maxx]=max(areamatrix);

maxcentroid=props(maxx).Centroid;
imselected=bwselect(bw,maxcentroid(1),maxcentroid(2),8); 


img=immultiply(I,imselected);

img = double(img);
img = imresize(img, [256,256]);
img_vect = img(:);
centroid = zeros(k,1);
class = zeros(length(img_vect), k);

%% initialize centroid
maximum = max(img_vect);
for cent = 1:k
    centroid(cent,1)= cent * maximum / k;
end
iter = 0;
while(iter<10)
    class(1:length(img_vect),1:k) = 0;
    
    % classifying pixels
    for i = 1: length(img_vect)
        [val, ind]=min(abs(img_vect(i) - centroid((1:k),1)));
        class(i,ind)= img_vect(i);
    end
    
    % updating centroid
    for cent = 1:k
        centroid(cent, 1)= sum(class(:,cent))/length(find(class(:,cent)));
    end

    iter = iter +1; 
end

%Printing

figure;
subplot(3,4,1),imshow(I,[]),title('Original');
subplot(3,4,2),imshow(img,[]),title('Pre-processing');

for clust = 1:k
    
     cluster = reshape(class(1:length(img_vect),clust:clust), [256,256] );
      subplot(3,4,clust+2),imshow(cluster,[]),title('Cluster');
      
     
  %%    
       if clust==k
          
         
           
           
          se90 = strel('line', 5, 90); 
          
          Idil = imdilate(cluster, se90);
     %   A = imcrop(cluster,[0 5 250 250]);
     
      J = imclearborder(Idil,8);
      
      
       se900 = strel('line', 5, 90);
       Idilr = imerode(J , se900);
          
       
       %subplot(3,4,k+3),imshow(J,[]),title('clean');
        subplot(3,4,k+3),imshow(Idilr,[]),title('Clean');
      
        
          %%
           BBB=Idilr;
           AAA = imresize(BBB, [1024,1024]);
           DDD=im2bw(AAA,1);
           subplot(3,4,k+4), imshow(DDD,[]);title('Binary');
           
          
%%
      subplot(3,4,k+5),imshow(I),title('G.T');

hold on 


x = miasex1.VarName5(v);
y =1024-miasex1.VarName6(v);
r = miasex1.VarName7(v);


th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'Color','g','LineWidth',1);

%%

centerX = miasex1.VarName5(v);
centerY =1024-miasex1.VarName6(v);
radius = miasex1.VarName7(v);
circlePixels = (rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius.^2;

       SS = imresize(Idilr, [1024,1024]);
       KK=im2bw(SS,1);
binaryImage = KK >0; 


beforenumberBlackPixels = sum(binaryImage(:));
% Mask it
binaryImage(~circlePixels) = false;
numberBlackPixels = sum(binaryImage(:));

accuracy= (numberBlackPixels/beforenumberBlackPixels)*100;
subplot(3,4,k+6), imshow(binaryImage,[]);title(accuracy);

%% print image
     figure, imshow(I,[]);
     saveas(gcf,miasex1.mdb001(num),'png')
   
 se90 = strel('line', 5, 90);
      se0 = strel('line', 5, 0);
      Idil = imdilate(J, [se90 se0]);
 
      subplot(3,4,k+4),imshow(img,[]),title('tumor');
       hold on
       
       boundaries=bwboundaries(J,8);
       
       for l=1
           
b = boundaries{l};
plot(b(:,2),b(:,1),'g','LineWidth',1);

       end
   
      end
  
      if clust==k
          
          se90 = strel('line', 8, 90);
          se0 = strel('line', 8, 0);
          BWdil = imdilate(cluster, [se90 se0]);

      BWfill=imfill(BWdil,'holes');

      boundaries=bwboundaries(BWfill,8);

          com = bwconncomp(cluster,8);
          for n=1:com.NumObjects
          boundaries=bwboundaries(com.PixelIdxList(n));
          end 
         
          
  subplot(3,4,k+3),imshow(cluster,[]);title('Tumor Boundaries');
  
hold on

%draw tumor boundaries
for l=1
b = boundaries{l};
plot(b(:,2),b(:,1),'r','LineWidth',1);
end


      end 
 
end
end

        
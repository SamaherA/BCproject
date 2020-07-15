
srcFile=dir('/Users/...');
for i=1:113

    filename=strcat('/Users/...',srcFile(i).name);
    I=imread(filename);


img{1} = imrotate(I,90);
img{2} = imrotate(I,180);
img{3} = imrotate(I,270);
img{4} = flip(I,1);
img{5} = flip(I,2);
img{6}= imnoise(I,'salt & pepper',0.02);

y=6*(i-1);

for image = 1:6
 
glcm = graycomatrix(img{image},'Offset',[-1 1]);
stats = graycoprops(glcm);

Entropy = entropy(img{image});

y=y+1;

 Tablefeatures.Var1( y )=stats.Contrast;
 Tablefeatures.Var2( y )=stats.Correlation;
 Tablefeatures.Var3( y )=Entropy;
 Tablefeatures.Var4( y )=stats.Homogeneity;
 Tablefeatures.Var5( y )=miasex12.B(i);
 
end
end



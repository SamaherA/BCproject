
srcFile=dir('/Users/...');
for i=1:113

    filename=strcat('/Users/...',srcFile(i).name);
    I=imread(filename);

    
%CREAT TABLE
 varTypes      ={'double','double','double','double'};
 Tablefeatures =table('size',[113 4],'VariableTypes',varTypes);

%EXTRACT FEATURES
 glcm    =graycomatrix(I,'Offset',[-1 1]);
 stats   =graycoprops(glcm);
 Entropy =entropy(I);

 %FEATRUES RECORDING
 Tablefeatures.Var1(i)=stats. Contrast;
 Tablefeatures.Var2(i)=stats.Correlation;
 Tablefeatures.Var3(i)=Entropy;
 Tablefeatures.Var4(i)=stats.Homogeneity;
   
 
end
 


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
 















 
% GLCM2 = graycomatrix(I,'Offset',[-1 1]); %2 0;0 2
% stats = GLCM_Features1(GLCM2,0); 
% 
% varTypes = {'double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double'};
% Tablefeatures=table('size',[113 22],'VariableTypes',varTypes);



% 
%     Tablefeatures.Var1(i)=stats.autoc(1);
%     Tablefeatures.Var2(i)=stats.contr(1);
%     Tablefeatures.Var3(i)=stats.corrm(1);
%     Tablefeatures.Var4(i)=stats.corrp(1);
%     Tablefeatures.Var5(i)=stats.cprom(1);
%     Tablefeatures.Var6(i)=stats.cshad(1);
%     Tablefeatures.Var7(i)=stats.dissi(1);
%     Tablefeatures.Var8(i)=stats.energ(1);
%     Tablefeatures.Var9(i)=stats.entro(1);
%     Tablefeatures.Var10(i)=stats.homom(1);
%     Tablefeatures.Var11(i)=stats.homop(1);
%     Tablefeatures.Var12(i)=stats.maxpr(1);
%     Tablefeatures.Var13(i)=stats.sosvh(1);
%     Tablefeatures.Var14(i)=stats.savgh(1);
%     Tablefeatures.Var15(i)=stats.svarh(1);
%     Tablefeatures.Var16(i)=stats.senth(1);
%     Tablefeatures.Var17(i)=stats.dvarh(1);
%     Tablefeatures.Var18(i)=stats.denth(1);
%     Tablefeatures.Var19(i)=stats.inf1h(1);
%     Tablefeatures.Var20(i)=stats.inf2h(1);
%     Tablefeatures.Var21(i)=stats.indnc(1);
%     Tablefeatures.Var22(i)=stats.idmnc(1);
%     

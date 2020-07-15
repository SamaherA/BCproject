
srcFile=dir('/Users/...');

for i=1:113

    filename=strcat('/Users/...',srcFile(i).name);
    I=imread(filename);

    %TOP HAT FILTER
    se = strel('disk',270);
    II = imtophat(I,se);
    
    %CROP AND RESIZE
    Icrop = imcrop(II,[   miasex12.VarName5(i)-50  1024-miasex12.VarName6(i)-50 ...
                         100+miasex12.VarName7(i) 100+miasex12.VarName7(i) ]);
   
    Isiz=imresize(Icrop,[120 120]);

    %SAVE
     s1 =     miasex12.mdb001(i);           s3 = '.pgm'    ; sA = strcat(s1,s3);
     
     imwrite(Isiz,sA);

end

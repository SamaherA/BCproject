
%DATA SPLITTING  
species_num=grp2idx(species);

rand_num=randperm(791);

Xtrain=features(rand_num(1:90),:);
Ytrain=species_num(rand_num(1:90),:);

Xtest=features(rand_num(91:end),:);
Ytest=species_num(rand_num(91:end),:);

%SVM CLASSIFICATION 
Model=fitcsvm(Xtrain,Ytrain,'KernelFunction','bolynomial');

%ACCURACY EVALUATION
Accuracy=  round(    sum(   predict(Model,Xtest)  == Ytest   )   /  length(Ytest)   *100    );


%RESULT PLOTTING
sv = Model.SupportVectors;

figure

gscatter(Xtrain(:,1),Xtrain(:,2),Ytrain)

hold on

plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)

legend('Bening','Malignant','Support Vector')
hold off



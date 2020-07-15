# BC project

SVM--
In this experiment, images inhanced using Tophat filter. Gray level co-occurrence matrices features are extracted at 0, 45, 90 and 135 with cropped image of size 120x120. Augmentation with 6 transformations is applied using image rotation in 3 directions 90, 180 and 270, horizontal and vertical image flipping and adding noise.And finally classified using the SVM classifier. 

Kmeans--
In this experiment, pre-processing step applied to remove the profile region of each image, after that k-means clustering technique used with number of clusters equal to 6. In order to improve the result, it is better if we remove the muscle area of the breast, and here we remove it by image boarder clearing. 

CNN--
In this experiment, the regions of abnormality were cropped and resized into size of 50x50, in order to have more images an augmentation were applied on the dataset for some transformations including rotations, transformations, reflections, crops, zooms and jittering. The data set balanced because the number of images of each class vary from each other and that may affect the classification process results. Two convolutional layers used, the first one with 32 channels and 5x5 filter size, the second one with 64 channels and 5x5 filter size and each layer followed by Max pooling layer with 2x2 filter size. the fully connected layer was with 1024 neurons with softmax activation. The learning rate used was 0.003.



Using MiniMias Dataset: http://peipa.essex.ac.uk/info/mias.html

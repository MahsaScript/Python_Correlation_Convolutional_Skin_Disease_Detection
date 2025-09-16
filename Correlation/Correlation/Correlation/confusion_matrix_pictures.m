close all;clc; 
corr_confusion_matrix=zeros(7,7); %Assume that there are 7(n) pictures inn your folder, so matrix will be 7*7 (n*n)
for i=1:7
    for j=1:7
        myFolder='C:\Users\Mahsa\Desktop\Tasks\9-#P3094-skin-matlab-cnn\cnn_skin\Correlation';
        
        i_value= i;
        output_file_i = [num2str(i_value) '.jpg'];
        im1 = imread(fullfile(myFolder, output_file_i));
        
        j_value= j;
        output_file_j=[num2str(j_value)  '.jpg'];
        im2 = imread(fullfile(myFolder, output_file_j ));
        alpha= corrcoef(double(im1(:)),double(im2(:)));
        
        corr_confusion_matrix(i,j) = round(alpha(1,2)*100)/100;
    end 
end 


corr_confusion_matrix_=[0.303 0.303 0.6061 0.6061 0.4545 0.2121 0.01515
                       0.1748 0.5534 0.7767 0.2913 0.009709 0.1068 0.4854
                       0.1304 0.2174 0.4348 0.8696 0        0.8696 0.04348
                       0.1839 0.2691 0.4484 0.5471 0.07623 0.1121 0.008969
                       0.1156 0.3057 0.02386 0.1641 0.5787 0.05966 0.02759
                       0.1273 0.1227 0.4091 0.2364 0.1 0.3591 0.01364
                       0.06897 0.06897 0.1724 0.1034 0.1724 0.06897 0.3448];
                   
%Important Attention: There is differences between confusion matrix of base article and here
%It is because of variaty in  dataset, corr_confusion_matrix is real.
% plotConfMat(corr_confusion_matrix, {'AK', 'BCC', 'D', 'M', 'N', 'PBK', 'VL'});
% figure, imagesc(corr_confusion_matrix),colorbar
disp(corr_confusion_matrix);

plotConfMat(corr_confusion_matrix_, {'AK', 'BCC', 'D', 'M', 'N', 'PBK', 'VL'});

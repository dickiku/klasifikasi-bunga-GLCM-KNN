clear
clc
close all
%pelatihan
cd('E:\PCDL\dat bunga');
datasetku={'B1';'B2'};
[fitur_mat, kelas]=glcm(datasetku);

model=fitcknn(fitur_mat,kelas'); %membangun model klasifikasi knn

%pengujian hasil
[uji,klasifikasi,hasil,s] = knn_solo(model);
figure;
imshow(s);
title(hasil,'FontSize',15);
[{'Contrast','Correlation','Energy','Homogeneity','Kelas','Hasil'};
    num2cell([uji klasifikasi']) hasil']

%pengujian akurasi
% [uji,target,klasifikasi,hasil] = knn_acu(model);
% [{'Contrast','Correlation','Energy','Homogeneity','Target','Kelas','Hasil'};
%    num2cell([uji target' klasifikasi']) hasil']
% cm=confusionmat(target',klasifikasi')
% akurasi=sum(diag(cm))/sum(sum(cm))
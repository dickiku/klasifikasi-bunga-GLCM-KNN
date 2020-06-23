function [fitur_mat,kelas] = glcm_lat(datasetku)
    %cd('E:\PCDL\dat bunga');
    %datasetku={'B1';'B2'};
    jmlkls=length(datasetku);
    for n=1:jmlkls
        cd(char(datasetku(n)));
        datacitra=dir('*.jpg');
        jmldata=length(datacitra);  
        for i=1:jmldata
           namafile=datacitra(i).name;
           citrai=rgb2gray(imread(namafile));

           fitur = graycoprops(graycomatrix(citrai, 'offset',[-1 0]));
           fitur_mat(i+jmldata*(n-1),1)=fitur.Contrast;
           fitur_mat(i+jmldata*(n-1),2)=fitur.Correlation;
           fitur_mat(i+jmldata*(n-1),3)=fitur.Energy;
           fitur_mat(i+jmldata*(n-1),4)=fitur.Homogeneity;

           kelas(i+jmldata*(n-1))=n;
        end
        cd('..');
    end
end


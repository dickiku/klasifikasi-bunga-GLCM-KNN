function [uji,klasifikasi,hasil,s] = knn_solo(model)
    [I,path]=uigetfile('*.jpg','select a input image');
    str=strcat(path,I);
    s=imread(str);
    
    a=rgb2gray(s);
    m=graycomatrix(a);
    g=graycoprops(m);
    uji(1)=g.Contrast;
    uji(2)=g.Correlation;
    uji(3)=g.Energy;
    uji(4)=g.Homogeneity;

    klasifikasi=model.predict(uji());%melakukan prediksi dr model
    if klasifikasi' == 1
        hasil= {'Bunga Daisy'};
    elseif klasifikasi' == 2
        hasil= {'Bunga Matahari'};
    else
        hasil = {'Tidak diketahui'};
    end
end


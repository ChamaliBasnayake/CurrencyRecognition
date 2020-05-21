%% Taking an Imagerkspace and command window
clear;clc;
%% read image
[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);
%preprocessing
%resize image
im=imresize(im,[128 128]);
imshow(im);
title('Input Currency');
prompt='Type the currency';
c = input(prompt,'s');
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=totalfeature(rgbim);
load db;
k=length(currency);
try
    currency(k+1) = struct('feature', fet, 'name', c);
    save db.mat currency
catch 
    currency(k+1) = struct('feature', fet, 'name', c);
    save db.mat currency
  
end
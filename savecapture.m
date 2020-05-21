function savecapture(img)
    persistent k
    if isempty(k)
        k = 0;
    end
    baseFileName = sprintf('img_web(%d).jpg', k);
    imwrite(img,baseFileName);
    k=k+1;

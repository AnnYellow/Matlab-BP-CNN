function  showWeights(cnn)
%SHOWWEIGHTS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
num_layer = numel(cnn.layer);
for in = 1:num_layer
    switch cnn.layer{in}{1}
        case 'conv'
            figure
            wnum = cnn.layer{in}{2};
            square = sqrt(wnum);
            if square ~= floor(square)
                square = floor(square);
                fnumh = square+1;
                fnumv = square;
            else
                square = floor(square);
                fnumh = square;
                fnumv = square;
            end
            iwnum = 1;
            for im = 1:fnumh
                for ik = 1:fnumv
                    if iwnum >  wnum
                        continue;
                    end
                    subplot(fnumv,fnumh,iwnum)
                    imagesc(cnn.weights{in}(:,:,iwnum));
                    iwnum = iwnum + 1;
                end
            end
   
      
        case 'full'
            figure
            imagesc(cnn.weights{in});
            title('full');
            
        case 'output'
            figure
            imagesc(cnn.weights{in});
            title('output');
        otherwise
            
    end
end


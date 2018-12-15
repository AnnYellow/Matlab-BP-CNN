cnn.eta = 1;
cnn.lambda = 5;

ntrain = size(training_data_label,2);
mini_batch_size = 100;
cnn.ntrain = ntrain;
accuracy = zeros(1,50);
cnn.layer = {
    % input layer: 'input', mini_size, [height,width] of image
    {'input',mini_batch_size,[28,28]};
    % convlution layer: 'conv', kernel_number, [height,width] of kernel
    {'conv',20,[9,9]}; 
    % pooling layer: 'pool', pooling_type, [height,width] of pooling area
    {'pool','mean',[2,2]};
    % flatten layer: 'flat', a layer for pre-allocated memory
    {'flat'};
    % full connect layer: 'full', neuron number
    {'full',100};
    {'full',100};
    % output layer: 'output', neuron number
    {'output',10};
    };

tic
cnn = cnn_initialize(cnn);
max_iter = 20000;
ik = 0;

disp('�����зŻص�ѵ������')
disp(['ÿ�μ������ѡȡ ',num2str(mini_batch_size), ' ���������м���'])
disp(['������ ',num2str(max_iter),' ��,�൱��ȫ�����ݵ��� ', ...
num2str(max_iter/(size(training_data,3)/mini_batch_size)),'��'])



for in = 1:max_iter
    pos = randi(ntrain-mini_batch_size);
    x = training_data(:,:,pos+1:pos+mini_batch_size);
    y = training_data_label(:,pos+1:pos+mini_batch_size);
    cnn = cnn_feedforward(cnn,x);
    cnn = cnn_backpropagation2(cnn,y);
    if mod(in,100) == 0
        disp('����������',num2str(in));
    end
    if mod(in,1000) == 0
        ik = ik + 1;
        accuracy(ik) = cnn_evaluate(cnn,validation_data,validation_data_label)*100;
        disp(['validtion accuracy: ',num2str(accuracy(ik)), '%']);
    end
end  

toc

plot(accuracy,'r','LineWidth',1.5)
grid on
title(['1+2����ṹ�������������ʶ����Ϊ: ��',num2str(max(accuracy)),'%']);
xlabel('��������:  X1000');
ylabel('����');

cnn_evaluate(cnn,test_data,test_data_label)
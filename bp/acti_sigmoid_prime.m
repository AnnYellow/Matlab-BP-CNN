function d = acti_sigmoid_prime(z)
% sigmoid������ĵ���
f = acti_sigmoid(z);
d = f.*(1-f);
end


function d = sigmoid_prime(z)
% sigmoid������ĵ���
f = sigmoid(z);
d = f.*(1-f);
end


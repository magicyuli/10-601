function [t] = naiveBayesClassify(xTest, M, V, p)
  c_num = length(p);
  n = size(xTest)(1);
  p_test = zeros(n, c_num);
  for i = 1:c_num
    c_mean = M(:,i)';
    c_v = V(:,i)';
    ln_gaussian = (-0.5) * ((xTest - c_mean).^2 ./ c_v + log(2 * pi * c_v));
    p_test(:,i) = sum(ln_gaussian, 2) + log(p(i));
  end
  [m, t] = max(p_test, [], 2);
end

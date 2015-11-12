function [ls] = logSum(x)
  m = max(x);
  ls = m + log(sum(exp(x - m)));
end

function [p] = sigmoidProb(y, x, w)
  if y == 0
    p = 1 / (1 + exp(x * w));
  else
    p = 1 - 1 / (1 + exp(x * w));
  end
end

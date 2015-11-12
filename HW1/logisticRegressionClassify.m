function [cls] = logisticRegressionClassify(xTest, w)
  p = 1 ./ (1 + exp(xTest * w));
  cls = p <= 0.5;
end

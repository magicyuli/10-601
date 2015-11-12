function [w] = logisticRegressionWeights(xTrain, yTrain, w0, nIter)
  for i = 1:nIter
    p1 = exp(xTrain * w0) ./ (1 + exp(xTrain * w0));
    gradient = (yTrain - p1)' * xTrain;
    w0 = w0 + 0.1 * gradient';
  end
  w = w0;
end

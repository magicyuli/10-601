function [p] = prior(yTrain)
  p = accumarray(yTrain(:), 1) / length(yTrain);
end

function [M, V] = likelihood(xTrain, yTrain)
  % number of classes
  c_num = length(unique(yTrain));
  % number of data
  n = length(yTrain);
  y_mat = zeros(n, c_num);
  y_mat_avg = zeros(n, c_num);
  for i = 1:c_num
    y_mat(:,i) = yTrain == i;
    y_mat_avg(:,i) = (yTrain == i) / sum(yTrain == i);
  end
  M = xTrain' * y_mat_avg;
  avg_mat = y_mat * M';
  V = ((xTrain - avg_mat).^2)' * y_mat_avg;
end

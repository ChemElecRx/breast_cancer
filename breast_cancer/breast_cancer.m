% Load dataset from CSV file
data = readtable('data.csv');

% Separate predictors (features) and response (labels)
X = data(:, 3:end);  % Features (exclude the id and diagnosis columns)
Y = data(:, 2);      % Labels (diagnosis column)

% Split data into training and testing sets (70% training, 30% testing)
rng(1);  % For reproducibility
cv = cvpartition(size(X, 1), 'HoldOut', 0.3);  % Create a holdout cross-validation partition
idxTrain = cv.training;  % Logical indices for the training set
idxTest = cv.test;       % Logical indices for the test set

XTrain = X(idxTrain, :);
YTrain = Y(idxTrain, :);

XTest = X(idxTest, :);
YTest = Y(idxTest, :);
%disp(YTest);
% Train SVM model
svmModel = fitcsvm(XTrain, YTrain, 'Standardize', true, 'KernelFunction', 'linear');

% Predict labels for test data
YTestPred = predict(svmModel, XTest);
%disp(YTestPred);

% Convert YTest to a cell array
YTestCell = table2cell(YTest);

% Ensure both YTestPred and YTestCell are column vectors
YTestPred = YTestPred(:);
YTestCell = YTestCell(:);

% Evaluate the performance of the classifier
accuracy = sum(strcmp(YTestPred,YTestCell))/numel(YTestCell);
%disp(YTestPred);
fprintf('Accuracy on test set: %4.2f%%\n', accuracy * 100);
%disp(YTest);

% Create a table with predictions and actual labels
combinedTable = table(YTestPred, YTestCell, 'VariableNames', {'YTestPred', 'YTest'});

% Specify the file name
filename = 'myData.csv';

% Write table to CSV file
writetable(combinedTable, filename, 'Delimiter', ',', 'QuoteStrings', true);

% Display contents of the CSV file
type 'myData.csv';

%Confusion matrix
C = confusionmat(YTestCell, YTestPred);
disp('Confusion Matrix:');
disp(C);
# Breast Cancer Prediction Project

This project uses the Kaggle breast cancer dataset to train and evaluate an SVM model for predicting breast cancer diagnosis. The project includes data processing, model training, performance evaluation, and result visualization.

## File Descriptions

- `data.csv`: The breast cancer dataset downloaded from Kaggle.
- `myData.csv`: The output file containing the predicted labels (YTestPred) and actual labels (YTest).
- `202406140459.gif`: A gif showing a demonstration of running `breast_cancer.m` in MATLAB and reviewing `myData.xlsx`.
- `myData.xlsx`: An Excel file calculating the number of false and true predictions (7 false, 163 true, total 170).
- `breast_cancer.m`: The source code for the project.
- `report.html`: The HTML report detailing the project results.

## Project Overview

### Data Processing

The dataset was loaded from a CSV file. Predictors (features) were separated from the response (labels). The first two columns were excluded as they contain the ID and diagnosis information. The remaining columns were used as features.

### Data Splitting

The data was split into training and testing sets with a 70-30 split. The `cvpartition` function was used to create a holdout cross-validation partition to ensure reproducibility.

### Model Training

An SVM model with a linear kernel was trained on the training set. The features were standardized before training.

### Model Prediction

The trained SVM model was used to predict the labels for the test set.

### Performance Evaluation

The accuracy of the model on the test set was calculated, and a confusion matrix was created to evaluate performance in detail.

### Results

- **Accuracy on test set:** 95.88%
- **Confusion Matrix:**

    | Actual / Predicted | Positive | Negative |
    |--------------------|----------|----------|
    | Positive           | 62       | 2        |
    | Negative           | 5        | 101      |

There are 7 false predictions (5 false positives and 2 false negatives) and 163 true predictions, resulting in a total of 170 test samples.

### Visualization

The `202406140459.gif` file shows a demonstration of running `breast_cancer.m` in MATLAB and reviewing `myData.xlsx`.

## Usage

1. Ensure all the files are in the same directory.
2. Run the `breast_cancer.m` script to process the data, train the model, make predictions, and generate the `myData.csv` output file.
3. Open `report.html` in a web browser to view the detailed report.

## License

The breast cancer dataset used in this project is available on Kaggle and is subject to the following license:

### Kaggle Dataset License

https://creativecommons.org/licenses/by-nc-sa/4.0/

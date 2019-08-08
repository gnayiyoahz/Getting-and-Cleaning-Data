# The Code Book

### Study Design

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



### Used Raw Data Files

1. *'train/subject_train.txt'*: Each row identifies the subject who performed the activity for each sample in the training set.
2. *'train/X_train.txt'*: Training set.
3. *'train/y_train.txt'*: Training labels.
4. *'test/subject_test.txt'*: Each row identifies the subject who performed the activity for each sample in the test set.
5. *'test/X_test.txt*': Test set.
6. *'test/y_test.txt'*: Test labels.
7. *'activity_labels.txt'*: Links the class labels with their activity name.
8. *'features.txt'*: List of all features. 
9. *'features_info.txt'*: Explanation of the features.



### Unused Raw Data Files

1. All files in the *'test/Inertial Signals'* folder
2. All files in the *'train/Inertial Signals'* folder



### Data Processing Steps

In this project, we aim to collect, work with, and clean a data set based on the experimental data.

- Obtaining a tidy dataset from the raw data.
  1. All raw data is downloaded from its source.
  2. Relevant files are read by `read.table()` and stored as different variables. 
  3. The training and the test sets are merged one data set.
  4. Only the measurements on the mean and standard deviation are extracted.
  5. The data set is appropriately labeled with descriptive variable names.
  6. The activities are named with descriptive names as in *'activity_labels.txt'*

- All the above tidy data is stored in `data`, a data frame where each row represents an experimental sample and each column represents a variable.
- From `data`, a second, independent tidy data set is created as `final`. 
- The final dataset is stored in *'tidy_data.txt'*.



### Code Book

- `subject_train`: Training set subjects. (7352 obs.)
- `X_train`: Training set data. (7352 obs. of  561 variables)
- `y_train`: Training set activities (7352 obs.)
- `subject_test`: Test set subjects. (2947 obs.)
- `X_test`: Test set data. (2947 obs. of  561 variables)
- `y_test`: Test set activities (2947 obs.)
- `activity_labels`: Activity description matching activity numbers to activity names. (6 rows of different activities, 2 columns -- number and name)
- `features`: Feature description matching feature numbers to feature names. (561 rows of different features, 2 columns -- number and name)
- `mean_std`: Logical vector, `TRUE` where the feature is a measurement on the mean or standard deviation. 

- `data`: After combining the data sets, `data` is a data frame of 10299 obs. of  68 variables. 10299 = 7352+2947= total number of samples. 68 = 66+2 where there are 66 features on the mean or standard deviation and 2 other columns representing subject and activity.
-  `final`: A tidy dataset with 180 obs. of  68 variables. 180 = 30x6 where 30 is the number of subjects and 6 is the number of activities, generating 180 subject-activity combinations. Each row contains the data of a *subject-activity* combination, and each column contains the average of each variable.



### License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

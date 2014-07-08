getdata
=======

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. In those experiments, 30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing the smartphone, and a 561-feature vector with time and frequency domain variables was used to record accelerations.

Those datasets were imported to modify the data.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Steps:
1. download the datasets, and combine test set with training set.
2. calculate mean and standard deviation for each 561 features.
3. download activity names and match them with datasets.
4. download feature names and match them with variables.
5. divid the data into two levels: 30 subjects and 6 activities, and calculate mean for each 561 features.Then write the tidy data to file.

Source:
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
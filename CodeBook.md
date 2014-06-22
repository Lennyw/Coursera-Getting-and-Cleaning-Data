#Codebook

The UCI HAR Dataset stands for the Human Activity Recognition Using Smartphones Dataset,
which is a collection of data from experiments performed by 30 volunteers performing six
activities, during which time their 3-axial linear acceleration and velocity have been
captured.

##Data Used
The following files from the dataset were used to generate the tidy.txt dataset from the
UCI HAR Dataset:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training dataset.
- 'train/y_train.txt': Training activity labels.
- 'test/X_test.txt': Test dataset.
- 'test/y_test.txt': Test activity labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity 
	for each window sample. Its range is from 1 to 30. 
- 'test/subject_train.txt': Each row identifies the subject who performed the activity 
	for each window sample. Its range is from 1 to 30. 

##Labels
WALKING : Measurements taken while the subject is walking
WALKING_UPSTAIRS : Measurements taken while the subject is walking up stairs.
WALKING_DOWNSTAIRS : Measurements taken while the subject is walking down stairs.
SITTING : Measurements taken while the subject is sitting.
STANDING : Measurements taken while the subject is standing still.
LAYING : Measurements taken while the subject is laying down.

##Process
The script reads the subjects, labels, and dataset for both training and test cases and
combines them into one single data frame. It then reads the 'features.txt' and uses this 
to assign the correct type of measurement to the collected data columns. The 
'activity_labels.txt' is then read in order to replace the numeric labels that were read
from the 'y_' datasets. The variables and their datapoints are then processed for the mean
 of their measurements such that each activity for each subject only has one line of 
 measurement means. 

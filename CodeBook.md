<H2>CodeBook.md -- details on the generation of mean_results.txt</H2>

The data for this project was gathered from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(see also: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

<H3>Summary</H3>
The data were gathered from 30 volunteers, each performing six activities (WALKING, WALKING_UPDSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING) while wearing a smartphone on the waist.  3-axial acceleration and angular velocity measurements were taken, using the embedded accelerometer and gyroscope.  When combined into a single data set, there are a grand total of 10299 observations across 563 variables (including Participant and Activity in that count).

For the purposes of this project, we took separate data sets (participants, activities, and measurement variables) and merged them into one single table.  For clarity, we replaced the number-designation for each activity with the activity descriptor (e.g, WALKING instead of '1').  In this process, we also culled out only the observations that included either mean [mean()] or standard deviation [std()] summary statistics.  There were multiple such measurements per person per activity, so we summarized them further by computing the mean of each variable for each person-activity combination.  A description of the variable naming conventions can be found below; however, just to be clear, we will give an example:

tBodyAcc-mean()-X = this would be the average (mean) of all time-domain Body Accelerometer readings, taken for a given person-activity, in the X-direction.


The features included in this results summary can be best summarized by their components.  The first subset below consists of time-domain Accelerometer, Gyroscope, and Jerk measurements; the second subset consists of Magnitude computations on these data; and the third subset consists of Fast Fourier Transform (FFT) results for some of these data.

********************************************************************************
<H3>Note that each of these values isolates the X-, Y-, an Z-directions</H3>
********************************************************************************

tBodyAcc = time-domain Body Accelerometer readings
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

tGravityAcc = time-domain Gravity Accelerometer readings
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

tBodyAccJerk = time-domain Body linear Acceleration Jerk signals
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

tBodyGyro = time-domain Body Gyroscope readings
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

tBodyGyroJerk = time-domain Body Gyroscope Jerk signals
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

********************************************************************************
<H3>The following Magnitude computations were calculated using the Euclidean norm</H3>
********************************************************************************

tBodyAccMag = time-domain Body Accelerometer Magnitude
    -mean() / -std() = either the mean or standard-deviation summary statistic

tGravityAccMag = time-domain Gravity Accelerometer Magnitude
    -mean() / -std() = either the mean or standard-deviation summary statistic

tBodyAccJerkMag = time-domain Body Accelerometer Jerk Magnitude
    -mean() / -std() = either the mean or standard-deviation summary statistic
    
tBodyGyroMag = time-domain Body Gyroscope Magnitude
    -mean() / -std() = either the mean or standard-deviation summary statistic

tBodyGyroJerkMag = time-domain Body Gyroscope Jerk Magnitude
    -mean() / -std() = either the mean or standard-deviation summary statistic

********************************************************************************
<H3>Fast Fourier Transform (FFT) data, computed from some of the previous signals</H3>

NOTE: apparent typos (e.g., "BodyBody" duplication) kept in naming
convention for clarity of relationship to original data set.  This only
affects the last three items below.
********************************************************************************

fBodyAcc = FFT applied to tBodyAcc data
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

fBodyAccJerk = FFT applied to tBodyAccJerk data
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

fBodyGyro = FFT applied to tBodyGyro data
    -mean() / -std() = either the mean or standard-deviation summary statistic
        -X / -Y / -Z = in either the X-, Y-, or Z-direction

fBodyAccMag = FFT applied to tBodyAccMag values
    -mean() / -std() = either the mean or standard-deviation summary statistic

fBodyBodyAccJerkMag = FFT applied to tBodyAccJerkMag values
    -mean() / -std() = either the mean or standard-deviation summary statistic

fBodyBodyGyroMag = FFT applied to tBodyGyroMag values
    -mean() / -std() = either the mean or standard-deviation summary statistic

fBodyBodyGyroJerkMag = FFT applied to tBodyGyroJerkMag values
    -mean() / -std() = either the mean or standard-deviation summary statistic

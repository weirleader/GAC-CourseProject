<H2>Peer Graded Assignment: Getting and Cleaning Data Course Project</H2>

script name: run_analysis.R

There is a single script for this assignment.  It is heavily annotated; however, I will reiterate the functionality here.

************************************************
Important note: when reading into R, it might 'helpfully' convert special characters (e.g., '-', '(', ')') into points '.'  This may be avoided by using 'check.names = FALSE' in your read.table call.
************************************************

The script is built to adapt to the data structure of the original zipped files, therefore it expects to find the 'test' and 'train' folders along with their respective files, including: subject_test.txt, X_test.txt, Y_test.txt, subject_train.txt, X_train.txt, Y_train.txt.  It also accesses the activity_labels.txt file as well as features.txt, where we find the descriptive labels for activities tracked in the data and a full list of labels for the types of data collected (column variables).

After reading in these values, the script uses a regular expression (RegEx) to locate all variable names (i.e., column headings) that contain "mean()" or "std()", which are identifiers for mean and standard deviation summary variables.  Once we know the desired variable names and column locations, these are used to create consolidated tables -- combining the participant ID (e.g., test_ID) to the matching activity (test_activity) as well as the subset of desired variable data (i.e., cols_of_interest).  Then, this data is merged again into a single table, containing both 'test' and 'train' data (alldata).

Using the column identifiers already gathered, we label the variable columns with more meaningful identifiers.  The identifiers are quite complex, perhaps confusingly so, but I left them unchanged because so much information is encoded there (e.g., test type, signal measured, mean vs. std_dev, and direction).  Data were then sorted by Participant and Activity and the activities were more appropriately labeled by cross-referencing with the activity_labels table (a_labels).

The final act is to group data by Participant and Activity so that it can easily be summarized to create a mean value across each combination of Participant and Activity with each variable.

Dataset files:
================
README.md
CodeBook.md
run_analysis.R

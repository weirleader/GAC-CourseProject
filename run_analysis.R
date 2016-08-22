library(dplyr)
library(stringr)

## begin by locating data and reading it all in
##
subdir <- "data/UCI HAR Dataset/"
testdir <- paste0(subdir,"test/")
traindir <- paste0(subdir, "train/")

## read in activity labels and features
##
a_labels <- read.table(paste0(subdir, "activity_labels.txt"))
feats <- read.table(paste0(subdir, "features.txt"))

test_ID <- read.table(paste0(testdir, "subject_test.txt"))
test_data <- read.table(paste0(testdir, "X_test.txt"))
test_activity <- read.table(paste0(testdir, "Y_test.txt"))

train_ID <- read.table(paste0(traindir, "subject_train.txt"))
train_data <- read.table(paste0(traindir, "X_train.txt"))
train_activity <- read.table(paste0(traindir, "Y_train.txt"))

## we only need to grab data involving mean [mean()] and standard
## deviation [std()], so I am only pulling out those that appear to
## be a direct computation of mean and/or std_dev based on other
## captured variables.  Note that I am intentionally ignoring
## meanFreq(), gravityMean, etc.
##
## column indices
##
cols_of_interest <- grep("mean\\(|std\\(", feats[,2])
##
##headings_of_interest
##
headings_of_interest <- as.character(feats[,2][cols_of_interest])

## now, merge the Participant, the Activity identifiers, and the 
## columns of interest (e.g., mean() and std()) into a single table
## for the 'test' group and a single table for the 'train' group.
test_table <- cbind(test_ID,
                    test_activity,
                    select(test_data, cols_of_interest))
train_table <- cbind(train_ID,
                     train_activity,
                     select(train_data, cols_of_interest))

## and then merge both 'test' and 'train' data into one, full table.
##
alldata <- rbind(test_table, train_table)

## name the columns with meaningful names, starting with Participant
## and Activity, and then including the selected 'mean()' and 'std()'
## headings, previously stored in 'headings_of_interest'.
##
names(alldata) <- c("Participant",
                    "Activity",
                    headings_of_interest)

## arrange all data by Participant, just because it feels more
## comfortable to me; then run through and substitute the actual
## activity names in place of their numeric identifier.
alldata <- arrange(alldata, Participant, Activity)
alldata$Activity <- a_labels[alldata$Activity,2]

## group data based upon Participant and Activity, then use
## 'summarize_all' function to compute mean for each column of
## data (excluding 'group_by' columns)
data_group <- group_by(alldata, Participant, Activity)
mean_results <- summarize_all(data_group, mean)
write.table(mean_results, file = "data/mean_results.txt", row.names = FALSE)
# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#Selecting data to view in console
select(NHANES, Age)
select(NHANES, Age, Weight, BMI)
#exclude colums:
select(NHANES, -HeadCirc)
select(NHANES, starts_with("BP"))
select(NHANES, ends_with("day"))
select(NHANES, contains("Age"))
?select_helpers
#Save the selected columns in a new data frame
nhanes_small <- select(NHANES, Age, Gender, Height,
                       Weight, BMI, Diabetes, DiabetesAge,
                       PhysActiveDays, PhysActive, TotChol,
                       BPSysAve, BPDiaAve, SmokeNow, Poverty)
#view data frame
nhanes_small

#renaming
#rename all columns to snakecase
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)
#view data frame
nhanes_small

rename(nhanes_small, sex = gender)
#view data frame
nhanes_small

#save it
nhanes_small <- rename(nhanes_small, sex = gender)
nhanes_small

#changing names with pipes (these two examples are the same)
colnames(nhanes_small)

nhanes_small %>%
    colnames()
#ctr_shift_M shortvut to pipe symbol

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

#exercise 9.9 practice what we've learned
nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)
nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)
#rename this with pipe function: select(nhanes_small, bmi, contains("age"))
nhanes_small %>%
    select(bmi, contains("age"))
#rename with PIPE:physical_activity <- select(nhanes_small, phys_active_days, phys_active) rename(physical_activity, days_phys_active = phys_active_days)
nhanes_small %>%
    select(phys_active_days) %>%
    rename(days_phys_active = phys_active_days)

#filtering data
nhanes_small %>%
    filter(sex == "female")
#participats that are not female
nhanes_small %>%
    filter(sex != "female")
#participant who have bmi 25
nhanes_small %>%
    filter(bmi == "25")
# Participants who have BMI equal to or more than 25
nhanes_small %>%
    filter(bmi >= "25")
# When BMI is 25 AND sex is female
nhanes_small %>%
    filter(bmi == "25" & sex == "female")
# When BMI is 25 OR sex is female
nhanes_small %>%
    filter(bmi == "25" | sex == "female")

# Arranging data by age in ascending order
nhanes_small %>%
    arrange(age)
nhanes_small %>%
    arrange(sex)
nhanes_small %>%
    arrange(desc(age))
# Arranging data by sex then age in ascending order
nhanes_small %>%
    arrange(sex, age)

#9.12 transform or add columns
nhanes_small %>%
    mutate(height = height / 100)
#or for new columns
nhanes_small %>%
    mutate(logged_height = log(height))
#height as meters and then take the natural logarithm, it would be:
nhanes_small %>%
    mutate(height = height / 100, logged_height = log(height))
#We can also have different values based on logic conditions using if_else() This means if physical active days are greater than 5, then yes will be in a new column (highly_active), or if less, it will be no.
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "yes", "no"))
#to save a new data set
nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "Yes", "No"))

#9.14 Split-apply-combine: Summarizing data
nhanes_small %>%
    summarise(max_bmi = max(bmi))
#remove any NA values (as above didn't work)
nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE))

nhanes_small %>%
    summarise(max_bmi = max(bmi, na.rm = TRUE),
              min_bmi = min(bmi, na.rm = TRUE))

#9.16 Exercise: Calculate some basic statistics
# 1.
nhanes_small %>%
    summarise(mean_weight = mean(weight, na.rm = TRUE), mean_age = mean(age, na.rm = TRUE))

# 2.
nhanes_small %>%
    summarise(max_height = max(height, na.rm = TRUE), min_height = min(height, na.rm = TRUE))

# 3.
nhanes_small %>%
    summarise(median_age = median(age, na.rm = TRUE), median_phys_active_days = median(phys_active_days, na.rm = TRUE))

#9.17 group by
nhanes_small %>%
    group_by(diabetes) %>%
    summarise(mean_age = mean(age, na.rn = TRUE), mean_bmi = mean(bmi, na.rm = TRUE))

nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    group_by(diabetes) %>%
    summarise(mean_age = mean(age, na.rn = TRUE), mean_bmi = mean(bmi, na.rm = TRUE)) %>%
    ungroup()

#Saving datasets as files
#saving data as an rda file in the data folder
usethis::use_data(nhanes_small, overwrite = TRUE)

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

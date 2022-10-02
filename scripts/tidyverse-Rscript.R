# R Script for The Carpentries tidyverse workshop

# Read in the Palmer penguins dataset
penguins <- read.csv("data/penguins.csv")

# Load the tidyverse package (install it first)
library("tidyverse")

# Plot the penguins dataset, compare 'bill_depth_mm' to 'bill_length_mm'

ggplot(data = penguins) +
  geom_point(
    mapping = aes(x = bill_depth_mm,
                  y = bill_length_mm)
  )

# CHALLENGE 1A
# How has bill length changed over time? What do you observe if you plot length versus year?
# Fill in for x and y

ggplot(data = penguins) +
  geom_point(
    mapping = aes(x =  , 
                  y =  )
  )


# CHALLENGE 1B
# Try a different geom_ function called geom_jitter. How is that different from geom_point?
# Try a different plotting function

ggplot(data = penguins) +
  geom_ (
    mapping = aes(x = year, 
                  y = bill_length_mm)
  )


# Mapping data
# See your plot points by category
# Add color to the data points by 'island'

ggplot(data = penguins) + 
  geom_jitter(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm, 
                  colour = island)
  )



# CHALLENGE 2
# What will happen if you switch colour to also be by year? Is the graph still useful? 
# Why or why not? What is the difference in the plot between when you colour by island and 
# when you colour by year?
# What do you add in for colour?

ggplot(data = penguins) +
  geom_jitter(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm,
                  colour =  )
  )


# There are other aesthetics we can use for the plot 
# What if we want to change the size of the points? 
# We can add 'size' like we did for 'colour'

ggplot(data = penguins) + 
  geom_jitter(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm, 
                  colour = species, 
                  size = year)
  )

# Another option for aesthetics is shape, and we can combine things too

ggplot(data = penguins) + 
  geom_jitter(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm, 
                  colour = species, 
                  shape = species)
  )

# You may also just want to set one color for all your points
# Let's set all the points to be blue

ggplot(data = penguins) + 
  geom_point(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm),
    colour = "blue"
  )


# CHALLENGE 4
# Change the transparency (alpha) of the data points to 0.5.
# Hint - this is another aesthetic like shape 

ggplot(data = penguins) + 
  geom_point(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm),
    
  )

# CHALLENGE 3
# Change the transparency (alpha) of the data points by year
# Hint - this is another aesthetic like shape, if it's by a variable, it needs
# to be in that mapping section

ggplot(data = penguins) + 
  geom_point(
    mapping = aes(x = bill_depth_mm, 
                  y = bill_length_mm, 
                  alpha = 
    )
  )


# What if you want to add a regression line
# Plot like you did before and then layer on the regression

ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm, 
                     y = bill_length_mm)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm")
`geom_smooth()` using formula 'y ~ x'


# CHALLENGE 5
# Modify the plot so the the points are coloured by island, but there is a single regression line.

ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm, 
                     y = bill_length_mm)) +
  geom_point(mapping = aes(colour =    ),
             alpha = 0.5) +
  geom_smooth(method = "lm")
`geom_smooth()` using formula 'y ~ x'    


# We may want all of these species in their own plots. We can do that with faceting.

ggplot(penguins, 
       aes(x = bill_depth_mm, 
           y = bill_length_mm,
           colour = species)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  facet_wrap(~ sex)
`geom_smooth()` using formula 'y ~ x'




##### Subsetting data with dplyr

# Now we see how we can visualize data. How do we prepare our data for plotting?


### Columns  

# Working with the penguins dataset again, let's select just a few columns

# Let's remember column names and what generally is in each column    
glimpse(penguins)

# Let's select just island, species and sex from the penguins dataset
# We can use the function in tidyverse 'select'

select(penguins, island, species, sex)

# You can also select columns by the number of the column

select(penguins, 1:3, 6)

# Or select everything but certain rows

select(penguins, -bill_length_mm, -bill_depth_mm)


# CHALLENGE 1
# Select the columns sex, year, and species from the penguins dataset.



# CHALLENGE 2
# Change your selection so that species comes before sex. What is the difference in the output?


# Select columns that end in 'mm'. For that we can use 'ends_with'

select(penguins, ends_with("mm"))

# We also can look for things at the start with 'starts_with'

select(penguins, starts_with("bill"))

# The tidy selector can be combined with each other and other selectors. 
# So you can build exactly the data you want!

select(penguins, island, species, year, starts_with("bill"))

# This is the full list of tidyselect functions
# https://tidyselect.r-lib.org/reference/language.html

# CHALLENGE 3
# Select all columns containing an underscore ("_").


# We've been printing things to the screen, but when we're creating new dataframes
# we want to use later, we can create a new dataframe


penguins_island <- select(penguins, island, species, year, starts_with("bill"))


# CHALLENGE 4
# Select the species and sex columns, in addition to all columns ending with “mm”. Create a new 
# dataframe 'mm_data'.


# CHALLENGE 5
# De-select all the columns with bill measurements. Create a new dataframe 'nobills'.





### Rows

# Select just the rows where body_mass_g is greater than 3000

filter(penguins, body_mass_g > 3000)

# Select just the rows where body_mass_g equals 2900

filter(penguins, body_mass_g == 2900)


# CHALLENGE 8
# Filter the data so you only have observations from the “Dream” island.



# CHALLENGE 9
# Filter the data so you only have observations after 2008


# You can also use multiple filters at once

filter(penguins, 
       species == "Chinstrap",
       body_mass_g < 3000)

# Add one more filter

filter(penguins, 
       species == "Chinstrap",
       body_mass_g < 3000,
       sex == "male")


# CHALLENGE 10
# Filter the data so you only have observations after 2008, and from “Biscoe” island


# CHALLENGE 11
# Filter the data so you only have observations of male penguins of the Chinstrap species


# Challenge 12
# Filter the data so you only have observations of male penguins of the Chinstrap species
# and make it a new data frame 'chinstrap'



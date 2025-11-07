# R Recap Exercise 2: Pricing Strategy Analysis
# ==============================================
#
# Learning objectives:
# - Import CSV data
# - Transform data from long to wide format
# - Compute new variables
# - Create a scatter plot
#
# Background:
# Your company conducted a pricing experiment testing three pricing strategies:
# - standard: current pricing model
# - discount_10: 10% discount off standard price
# - premium: 15% price increase over standard
#
# Each strategy was tested on different products over multiple trials to measure:
# 
# CONVERSION RATE: The proportion of potential customers who make a purchase.
#   Example: If 100 people view a product and 20 buy it, conversion rate = 0.20 (20%)
#   Higher conversion rates generally mean more effective pricing/marketing.
#
# AVERAGE TRANSACTION VALUE: The mean dollar amount spent per purchase.
#   This tells you how much revenue each successful sale generates.
#
# The data is in long format - one row per product-trial combination.

# Your tasks:
# ----------

# 1. IMPORT THE DATA
# ------------------
# Download the file 'pricing_experiment.csv' and place it in your working directory.
# Import the CSV file and store it in a variable called 'pricing'

# YOUR CODE HERE:



# 2. COMPUTE NEW VARIABLES
# -------------------------
# For each product and pricing strategy:
# a) Calculate the mean conversion rate across the 3 trials
# b) Calculate the mean transaction value across the 3 trials
#
# Store this in a new dataframe called 'product_averages'

# YOUR CODE HERE:
library(tidyverse)

product_averages <- pricing |>
  # Your code to group and summarize here
  

# 3. TRANSFORM FROM LONG TO WIDE
# -------------------------------
# Transform 'product_averages' so that each row is one product and
# the pricing strategies become separate columns for both conversion_rate and avg_transaction_value
#
# Hint: Use tidyr's pivot_wider() function
# Result should have columns like: product_id, standard_conversion, discount_10_conversion, etc.

# YOUR CODE HERE:
product_wide <- product_averages |>
  # Your transformation code here
  

# 4. COMPUTE EXPECTED REVENUE METRIC
# -----------------------------------
# For each pricing strategy, compute expected revenue per customer by multiplying:
# conversion_rate * avg_transaction_value
# 
# This tells you the expected revenue from each pricing approach.
# Create these new variables: standard_revenue, discount_10_revenue, premium_revenue

# YOUR CODE HERE:
product_wide <- product_wide |>
  # Your code to compute expected revenue here
  

# 5. CREATE A SCATTER PLOT
# -------------------------
# Create a scatter plot comparing pricing strategies:
# - X-axis: expected revenue from standard pricing
# - Y-axis: expected revenue from discount_10 pricing
# 
# Add a diagonal reference line (y = x) to show where strategies perform equally
# Add a smooth trend line to show the overall pattern
#
# Hint: Use ggplot2's geom_point(), geom_abline(), and geom_smooth()

# YOUR CODE HERE:


# BONUS CHALLENGE (optional):
# ----------------------------
# Determine which pricing strategy maximizes expected revenue for each product
# Calculate what percentage of products perform best under each strategy

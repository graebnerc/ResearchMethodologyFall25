# R Recap Exercise 1: Customer Satisfaction Tracking
# ===================================================
# 
# Learning objectives:
# - Import CSV data
# - Transform data from wide to long format
# - Compute summary statistics
# - Create a line plot
#
# Background:
# You work for a company that recently implemented new customer service protocols.
# Customer satisfaction data was collected at three time points: before the change (Q1),
# and at two follow-up periods (Q2, Q3). Customers rated their satisfaction with
# service quality and product value on a 1-5 scale.
# Each row represents one customer's ratings across all three quarters.

# Your tasks:
# ----------

# 1. IMPORT THE DATA
# ------------------
# Download the file 'customer_satisfaction.csv' and place it in your working directory.
# Import the CSV file and store it in a variable called 'customers'

# YOUR CODE HERE:



# 2. TRANSFORM FROM WIDE TO LONG
# -------------------------------
# The data is currently in "wide" format - each quarter is a separate column.
# Transform it to "long" format where:
# - One column indicates the quarter (q1, q2, q3)
# - One column indicates the metric type (service_quality, product_value)
# - One column contains the rating value
#
# Hint: Use tidyr's pivot_longer() function
# You'll need to separate the quarter and metric from the column names

# YOUR CODE HERE:
# library()

# customers_long <- customers |>
  # Your transformation code here
  

# 3. COMPUTE AVERAGE RATINGS
# ---------------------------
# Calculate the mean rating for each combination of quarter and metric type
# Store this in a new dataframe called 'satisfaction_summary'

# YOUR CODE HERE:
# satisfaction_summary <- customers_long |>
  # Your summarization code here
  

# 4. CREATE A LINE PLOT
# ----------------------
# Create a line plot showing how average customer satisfaction changes over quarters
# - X-axis: quarter
# - Y-axis: mean rating
# - Separate lines (different colors) for service_quality vs product_value
#
# Hint: Use ggplot2's geom_line() and color aesthetic

# YOUR CODE HERE:


# BONUS CHALLENGE (optional):
# ----------------------------
# Add a computed variable showing the "improvement from Q1" for each customer
# at Q2 and Q3, then analyze which metric showed greater improvement

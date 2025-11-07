# Data Generation Script: Customer Satisfaction
# ==============================================
# 
# This script generates sample data for Exercise 1
# Run this script to create the customer_satisfaction.csv file

set.seed(42)  # for reproducibility

customer_data <- data.frame(
  customer_id = 1:50,
  account_age_months = sample(6:36, 50, replace = TRUE),
  q1_service_quality = sample(1:5, 50, replace = TRUE),
  q1_product_value = sample(1:5, 50, replace = TRUE),
  q2_service_quality = sample(2:5, 50, replace = TRUE),
  q2_product_value = sample(2:5, 50, replace = TRUE),
  q3_service_quality = sample(3:5, 50, replace = TRUE),
  q3_product_value = sample(3:5, 50, replace = TRUE)
)

# Save as CSV
write.csv(customer_data, "customer_satisfaction.csv", row.names = FALSE)

cat("✓ Created customer_satisfaction.csv with", nrow(customer_data), "customer records\n")

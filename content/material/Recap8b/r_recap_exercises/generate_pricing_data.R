# Data Generation Script: Pricing Experiment
# ===========================================
# 
# This script generates sample data for Exercise 2
# Run this script to create the pricing_experiment.csv file

set.seed(123)  # for reproducibility

pricing_data <- data.frame(
  product_id = rep(1:30, each = 9),  # 30 products tested
  trial_number = rep(1:3, times = 90),  # 3 trials per pricing strategy
  pricing_strategy = rep(rep(c("standard", "discount_10", "premium"), each = 3), times = 30),
  conversion_rate = c(
    runif(90, min = 0.15, max = 0.25),  # standard pricing
    runif(90, min = 0.22, max = 0.35),  # 10% discount
    runif(90, min = 0.10, max = 0.18)   # premium pricing
  ),
  avg_transaction_value = c(
    rnorm(90, mean = 85, sd = 12),   # standard
    rnorm(90, mean = 78, sd = 10),   # discount (lower revenue per sale)
    rnorm(90, mean = 98, sd = 15)    # premium (higher revenue per sale)
  )
)

# Save as CSV
write.csv(pricing_data, "pricing_experiment.csv", row.names = FALSE)

cat("✓ Created pricing_experiment.csv with", nrow(pricing_data), "trial records\n")

# R Recap Exercise 1: Customer Satisfaction Tracking - SOLUTION
# ===============================================================

library(tidyverse)

# 1. IMPORT THE DATA
# ------------------
customers <- read.csv("customer_satisfaction.csv")

# Quick look at the data structure
head(customers)
str(customers)

# 2. TRANSFORM FROM WIDE TO LONG
# -------------------------------
customers_long <- customers |>
  pivot_longer(
    cols = starts_with("q"),
    names_to = c("quarter", "metric"),
    names_sep = "_",
    values_to = "rating"
  )

# Check the transformation
head(customers_long, 10)

# 3. COMPUTE AVERAGE RATINGS
# ---------------------------
satisfaction_summary <- customers_long |>
  group_by(quarter, metric) |>
  summarize(
    mean_rating = mean(rating),
    sd_rating = sd(rating),
    n = n(),
    .groups = "drop"
  )

# View the summary
print(satisfaction_summary)

# 4. CREATE A LINE PLOT
# ----------------------
ggplot(satisfaction_summary, aes(x = quarter, y = mean_rating, 
                                  color = metric, group = metric)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Customer Satisfaction Trends Over Three Quarters",
    subtitle = "Impact of new service protocols on customer perceptions",
    x = "Quarter",
    y = "Average Rating (1-5 scale)",
    color = "Metric"
  ) +
  scale_color_manual(
    values = c("product_value" = "#E69F00", "service_quality" = "#56B4E9"),
    labels = c("Product Value", "Service Quality")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "bottom"
  )

# BONUS CHALLENGE SOLUTION:
# --------------------------
# Compute improvement from Q1 baseline

customers_wide_bonus <- customers_long |>
  pivot_wider(
    names_from = c(quarter, metric),
    values_from = rating
  ) |>
  mutate(
    # Service quality improvements
    q2_service_improvement = q2_service_quality - q1_service_quality,
    q3_service_improvement = q3_service_quality - q1_service_quality,
    # Product value improvements
    q2_value_improvement = q2_product_value - q1_product_value,
    q3_value_improvement = q3_product_value - q1_product_value
  )

# Compare which metric improved more
improvement_summary <- customers_wide_bonus |>
  summarize(
    avg_service_improvement_q3 = mean(q3_service_improvement),
    avg_value_improvement_q3 = mean(q3_value_improvement)
  )

print("Average improvements from Q1 to Q3:")
print(improvement_summary)

# Visualize the distribution of improvements
customers_wide_bonus |>
  select(customer_id, q3_service_improvement, q3_value_improvement) |>
  pivot_longer(
    cols = ends_with("improvement"),
    names_to = "metric",
    values_to = "improvement"
  ) |>
  mutate(metric = str_remove(metric, "q3_") |> str_remove("_improvement")) |>
  ggplot(aes(x = improvement, fill = metric)) +
  geom_histogram(bins = 15, alpha = 0.7, position = "identity") +
  labs(
    title = "Distribution of Customer Improvement from Q1 to Q3",
    x = "Improvement Score (points)",
    y = "Number of Customers",
    fill = "Metric"
  ) +
  theme_minimal()

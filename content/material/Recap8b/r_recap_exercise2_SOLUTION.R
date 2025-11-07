# R Recap Exercise 2: Pricing Strategy Analysis - SOLUTION
# ===========================================================

library(tidyverse)

# 1. IMPORT THE DATA
# ------------------
pricing <- read.csv("pricing_experiment.csv")

# Quick look at the data structure
head(pricing)
str(pricing)
summary(pricing)

# 2. COMPUTE NEW VARIABLES
# -------------------------
product_averages <- pricing |>
  group_by(product_id, pricing_strategy) |>
  summarize(
    mean_conversion_rate = mean(conversion_rate),
    mean_transaction_value = mean(avg_transaction_value),
    n_trials = n(),
    .groups = "drop"
  )

# View the averages
head(product_averages, 12)

# 3. TRANSFORM FROM LONG TO WIDE
# -------------------------------
product_wide <- product_averages |>
  pivot_wider(
    id_cols = product_id,
    names_from = pricing_strategy,
    values_from = c(mean_conversion_rate, mean_transaction_value),
    names_sep = "_"
  )

# View the wide format
head(product_wide)

# 4. COMPUTE EXPECTED REVENUE METRIC
# -----------------------------------
product_wide <- product_wide |>
  mutate(
    standard_revenue = mean_conversion_rate_standard * mean_transaction_value_standard,
    discount_10_revenue = mean_conversion_rate_discount_10 * mean_transaction_value_discount_10,
    premium_revenue = mean_conversion_rate_premium * mean_transaction_value_premium
  )

# View expected revenues
product_wide |>
  select(product_id, ends_with("_revenue")) |>
  head(10)

# Summary statistics for expected revenue by strategy
expected_revs |>
  summarize(
    avg_standard_revenue = mean(standard_revenue),
    avg_discount_revenue = mean(discount_10_revenue),
    avg_premium_revenue = mean(premium_revenue)
  ) |>
  print()

# 5. CREATE A SCATTER PLOT
# -------------------------
ggplot(expected_revs, aes(x = standard_revenue, y = discount_10_revenue)) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", 
              color = "gray50", linewidth = 1) +
  geom_point(size = 3, alpha = 0.6, color = "#0072B2") +
  geom_smooth(method = "lm", se = TRUE, color = "#D55E00", linewidth = 1) +
  labs(
    title = "Comparing Expected Revenue: Standard vs. Discount Pricing",
    subtitle = "Each point represents one product",
    x = "Expected Revenue - Standard Pricing ($)",
    y = "Expected Revenue - 10% Discount Pricing ($)",
    caption = "Dashed line shows equal performance | Trend line shows relationship"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 11, color = "gray30")
  ) +
  coord_fixed(ratio = 1)  # Makes comparison easier

# BONUS CHALLENGE SOLUTION:
# --------------------------
# Determine which pricing strategy is best for each product

product_analysis <- product_wide |>
  mutate(
    best_strategy = case_when(
      standard_revenue >= discount_10_revenue & 
        standard_revenue >= premium_revenue ~ "standard",
      discount_10_revenue >= standard_revenue & 
        discount_10_revenue >= premium_revenue ~ "discount_10",
      TRUE ~ "premium"
    ),
    max_revenue = pmax(standard_revenue, discount_10_revenue, premium_revenue)
  )

# Calculate percentage by strategy
strategy_summary <- product_analysis |>
  count(best_strategy) |>
  mutate(percentage = n / sum(n) * 100)

print("Optimal pricing strategy distribution:")
print(strategy_summary)

# Visualize which strategy wins for each product
ggplot(product_analysis, aes(x = product_id, y = max_revenue, fill = best_strategy)) +
  geom_col() +
  labs(
    title = "Optimal Expected Revenue by Product",
    subtitle = "Color indicates which pricing strategy maximizes revenue",
    x = "Product ID",
    y = "Maximum Expected Revenue ($)",
    fill = "Best Strategy"
  ) +
  scale_fill_manual(
    values = c("standard" = "#56B4E9", "discount_10" = "#009E73", "premium" = "#E69F00"),
    labels = c("Standard", "10% Discount", "Premium")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "bottom"
  )

# Additional insight: Revenue lift analysis
product_analysis |>
  mutate(
    discount_vs_standard = (discount_10_revenue - standard_revenue) / standard_revenue * 100,
    premium_vs_standard = (premium_revenue - standard_revenue) / standard_revenue * 100
  ) |>
  summarize(
    avg_discount_lift = mean(discount_vs_standard),
    avg_premium_lift = mean(premium_vs_standard)
  ) |>
  print()

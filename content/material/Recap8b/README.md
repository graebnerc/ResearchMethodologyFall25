# R Recap Exercises: Business Data Analysis
## Teaching Materials Overview

This package contains two complete exercises for MA students learning R for business and economics applications.

---

## 📦 Package Contents

### Student Materials
- `r_recap_exercise1.R` - Exercise 1: Customer Satisfaction Tracking
- `r_recap_exercise2.R` - Exercise 2: Pricing Strategy Analysis
- `customer_satisfaction.csv` - Data file for Exercise 1
- `pricing_experiment.csv` - Data file for Exercise 2

### Instructor Materials
- `r_recap_exercise1_SOLUTION.R` - Complete solution for Exercise 1
- `r_recap_exercise2_SOLUTION.R` - Complete solution for Exercise 2
- `generate_customer_data.R` - Script to regenerate Exercise 1 data
- `generate_pricing_data.R` - Script to regenerate Exercise 2 data

---

## 📚 Exercise Descriptions

### Exercise 1: Customer Satisfaction Tracking
**Skills covered:**
- Importing CSV data
- Wide-to-long data transformation
- Computing summary statistics by groups
- Creating line plots with multiple series

**Business context:** Students analyze customer satisfaction data across three quarters to evaluate the impact of new service protocols on customer perceptions.

**Key concepts:** Customer satisfaction metrics, longitudinal analysis, service quality measurement

---

### Exercise 2: Pricing Strategy Analysis
**Skills covered:**
- Importing CSV data
- Long-to-wide data transformation
- Computing derived business metrics
- Creating scatter plots with reference lines

**Business context:** Students analyze results from a pricing experiment testing three strategies (standard, discount, premium) to determine optimal pricing approaches.

**Key concepts:** 
- **Conversion rate**: Proportion of potential customers who make a purchase
- **Average transaction value**: Mean revenue per successful sale
- **Expected revenue**: Conversion rate × Transaction value

---

## 🎓 Teaching Recommendations

### Before Class
1. Share the two exercise files and CSV files with students
2. Ask students to place CSV files in their R working directory
3. Students should have `tidyverse` package installed

### During Class
1. **Exercise 1** (25-30 minutes):
   - Review wide vs. long format concepts
   - Work through import and transformation together
   - Students complete summarization and plotting independently
   
2. **Exercise 2** (25-30 minutes):
   - Explain business metrics (conversion rate, transaction value)
   - Demonstrate long-to-wide transformation
   - Students compute metrics and create plots

3. **Wrap-up** (10-15 minutes):
   - Compare solutions
   - Discuss business insights from the analyses
   - Address optional bonus challenges

### After Class
- Share solution files for student reference
- Solutions include bonus challenges with additional visualizations

---

## 🔄 Regenerating Data

If you want to create fresh datasets with different random values:
1. Run `generate_customer_data.R` for Exercise 1 data
2. Run `generate_pricing_data.R` for Exercise 2 data

Both scripts use set seeds for reproducibility but can be modified to generate different data patterns.

---

## 📊 Learning Outcomes

After completing these exercises, students will be able to:
- Import and examine CSV data in R
- Transform data between wide and long formats as needed for analysis
- Compute summary statistics and derived metrics
- Create publication-quality visualizations
- Apply these skills to business and economics datasets

---

## 💡 Extensions

For advanced students or additional practice:
- Combine both datasets to analyze customer pricing sensitivity
- Add statistical tests to compare strategies
- Create interactive visualizations with plotly
- Export results to formatted reports with R Markdown

---

## 🛠️ Technical Requirements

- R (≥ 4.0)
- tidyverse package (includes dplyr, tidyr, ggplot2)
- RStudio recommended but not required

---

## 📝 Notes

- All exercises are discipline-agnostic and relevant across business/economics domains
- Data is simulated but reflects realistic business scenarios
- Solutions include comments explaining each step
- Bonus challenges encourage deeper exploration

---

**Questions or Issues?** Contact the course instructor.

# Spotify Churn Analysis

> A data-driven investigation into music streaming user retention patterns, identifying high-risk segments and actionable retention strategies.

![Churn Rate](https://img.shields.io/badge/Churn%20Rate-26%25-red)
![Dataset Size](https://img.shields.io/badge/Dataset%20Size-8%2C000%20Users-blue)
![Model](https://img.shields.io/badge/Model-Random%20Forest-brightgreen)

---

## 📊 Table of Contents

- [Problem Statement](#problem-statement)
- [Dataset Overview](#dataset-overview)
- [Key Findings](#key-findings)
- [High-Risk User Segment](#high-risk-user-segment)
- [Feature Importance Analysis (SHAP)](#feature-importance-analysis-shap)
- [Business Recommendations](#business-recommendations)
- [Technical Implementation](#technical-implementation)
- [Project Structure](#project-structure)

---

## 🎯 Problem Statement

### What is Customer Churn?

Users are classified as **churned** when they have not used the application for 30 consecutive days or when their account is closed/deleted by the user or Spotify.

While Spotify does not officially publish its inactivity threshold, 30 days represents a reasonable baseline—it corresponds to a typical billing cycle and aligns with typical daily usage patterns.

### Business Objective

Identify users at high risk of churn within the next month and develop targeted retention campaigns to minimize customer attrition.

### Prediction Output

- **Probability Score:** 0–1 scale
- **Churn Threshold:** Probability > 0.5 = high-risk user
- **Frequency:** Monthly predictions enable timely intervention

---

## 📈 Dataset Overview

**Source:** [Spotify Dataset for Churn Analysis](https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis/data) (Kaggle)

**Size:** 8,000 users | **Age Range:** 16–59 years

### Input Features

| Feature | Type | Description |
|---------|------|-------------|
| `age` | Numeric | User age |
| `country` | Categorical | Geographic location |
| `subscription_type` | Categorical | Free / Premium / Family / Student |
| `listening_time` | Numeric | Minutes per day |
| `songs_played_per_day` | Numeric | Daily song count |
| `skip_rate` | Numeric | Percentage of skipped songs |
| `device_type` | Categorical | Mobile / Desktop / Web |
| `ads_listened_per_week` | Numeric | Weekly ad count |
| `offline_listening` | Boolean | Offline mode usage |

### Dataset Statistics

| Metric | Value |
|--------|-------|
| Average Listening Time | 154 min/day (2.5 hrs) |
| Paid Subscription Rate | 75% |
| Free Subscription Rate | 25% |
| Overall Churn Rate | ~26% |
| Industry Benchmark | 5–7% (annual) |

---

## 🔍 Key Findings

<img width="1120" height="790" alt="image" src="https://github.com/user-attachments/assets/75e80f9a-5079-45ff-a356-ec787eab94aa" />

### Correlation Analysis

Most features show weak correlation with churn (strongest: 0.02 for skip rate), indicating **no single dominant predictor**. Notable exception: inverse relationship between offline listening and ads per week—explained by subscription plan specifics rather than user behavior.

### Churn Rate Distribution

- **By Subscription Type:** Family plan shows highest churn
- **By Gender:** Negligible impact (nearly equal distribution)
- **By Device Type:** Minimal variation (1–2%)
- **By Geography:** Pakistan shows highest regional churn rate

---

<img width="920" height="521" alt="image" src="https://github.com/user-attachments/assets/abacca26-1fd3-4cc5-b2db-770239e17bcb" />

## 👥 High-Risk User Segment

### Primary Risk Profile

Based on segment analysis across demographics and behavior:

| Dimension | Characteristic |
|-----------|-----------------|
| **Subscription** | Premium |
| **Countries** | France, United Kingdom |
| **Age Range** | 45–50 years |
| **Primary Device** | Desktop / Web |
| **Engagement Level** | Low–Moderate |

### Risk Factors by Category

**Age Patterns:**
- Highest churn spike observed in the 45–50 age bracket
- Current marketing campaigns predominantly target 18–35 demographic
- Older users may struggle to keep pace with platform trends and updates

**Geographic Concentration:**
- France and UK exhibit the highest churn rates
- Desktop/Web dominance suggests less frequent engagement patterns typical of older cohorts

**Device Behavior:**
- Desktop and Web users show slightly elevated churn vs. Mobile
- Mobile experience demonstrates consistency, suggesting device type is not a critical differentiator

### Retention Strategies for High-Risk Segment

**Personalized Content:**
- Age-appropriate playlists and recommendations (e.g., nostalgia-driven, classic hits)
- Curated daily mixes reflecting listening history

**Loyalty Programs:**
- Recognition of long-term subscription commitment
- Exclusive perks for users in the 45+ category
- Anniversary rewards and milestone bonuses

**Platform Optimization:**
- Conduct UX audit of Desktop/Web interfaces
- Ensure navigation is intuitive for less tech-savvy users
- Implement feature parity between mobile and web platforms

**Geographic Campaigns:**
- Market research to understand local competitor strategies
- Localized value propositions addressing region-specific needs
- Satisfaction surveys and competitive benchmarking

---
<img width="790" height="820" alt="image" src="https://github.com/user-attachments/assets/d8157b2b-692d-4b50-8ad5-65eb36401225" />

## 🔬 Feature Importance Analysis (SHAP)

SHAP (SHapley Additive exPlanations) values measure each feature's average impact on model predictions. The following features have the greatest influence on churn probability:

### 1. **Geographic Factor: Canada (country_CA)** 🇨🇦
**Impact Level:** ⭐⭐⭐⭐⭐ Highest

**Interpretation:**
Canadian users exhibit the strongest influence on model predictions, indicating either exceptional loyalty or heightened sensitivity to competitive alternatives. The elevated churn correlation links to high ad exposure on free/family plans, reflecting intense market competition (Spotify vs. YouTube Music, Apple Music).

<img width="690" height="453" alt="image" src="https://github.com/user-attachments/assets/dc422055-c0f3-4eaf-a310-bdfc076b7c83" />

**Business Implications:**
- Users from Canada represent a unique market segment with distinct behavior patterns
- Competitive pressure is a critical factor in Canadian user retention

**Recommended Actions:**

*Short-term:*
- Launch targeted ad-free premium promotions for Canadian users
- Offer limited-time trial bundles (e.g., 2+1 months free)

*Long-term:*
- Conduct competitive analysis: pricing, features, content libraries
- Develop differentiation strategies (enhanced personalization, exclusive content, superior algorithm)
- Optimize feature offerings relative to competitors

---

### 2. **User Experience: Ads Per Week (ads_listened_per_week)**
**Impact Level:** ⭐⭐⭐⭐ Second Highest

**Interpretation:**
Ad frequency is the second most important predictor of churn. High ad volume significantly increases churn probability, particularly among free and family plan users. Ad fatigue emerges as a critical friction point.

**Business Implications:**
- Every additional ad increases churn risk for vulnerable segments
- Free plan users face a trade-off between service cost and ad inconvenience
- Balanced ad strategy is essential to maintain revenue while reducing attrition

**Recommended Actions:**

*Optimization:*
- Implement algorithmic ad management: dynamically reduce ad intensity for high-churn-risk users
- A/B test optimal ad frequencies by user segment
- Cap daily ad limits for users showing churn indicators

*Conversion Strategy:*
- Offer "Ad-Free Trial" campaigns (7–14 days) to free users
- Tiered premium bundles emphasizing ad-free benefits
- Graduated promotions: users with high ad exposure receive premium discounts

*Revenue Balance:*
- Maximize advertiser reach while minimizing user abandonment
- Implement predictive models to adjust ad load in real-time based on individual churn risk

---

### 3. **Least Differentiating Factor: Mobile Device (device_type_Mobile)**
**Impact Level:** ⭐ Lowest

**Interpretation:**
Mobile device usage has the smallest average impact on churn predictions. This indicates a **consistent and reliable mobile experience** across devices. Primary churn drivers are engagement level, geographic location, and ad exposure—not device type.

**Business Implications:**
- Mobile platform is performing well relative to alternatives
- Device fragmentation is not a churn risk factor
- Engineering efforts should prioritize features over device-specific optimizations

**Recommended Actions:**

*Platform Strategy:*
- Maintain current mobile development priorities
- Focus innovation on feature parity across all platforms (Web, Desktop, Mobile)
- Invest in user engagement features rather than device-specific enhancements

---

## 💡 Business Recommendations

### Immediate Actions (Next 30 Days)

- ✅ Launch retention campaigns for users in Canada, France, and UK
- ✅ Create "Premium Trial" (7-14 days ad-free) targeting free plan users
- ✅ Implement segmented email outreach for 45–50 age group with personalized content
- ✅ Deploy churn prediction model to identify at-risk users weekly

### Medium-term Initiatives (3–6 Months)

- 📊 Develop age-appropriate content personalization algorithm
- 📊 Conduct UX audit of Desktop/Web platforms; implement improvements
- 📊 A/B test promotional offers by geographic region and subscription type
- 📊 Create loyalty program for high-value, at-risk segments
- 📊 Launch competitive analysis: pricing, features, user experience in target markets

### Long-term Strategy (6–12 Months)

- 🎯 Integrate churn prediction into production pipeline (monthly automated scoring)
- 🎯 Build dynamic ad optimization system (real-time load adjustment by user risk)
- 🎯 Establish continuous A/B testing framework for retention campaigns
- 🎯 Develop regional marketing playbooks tailored to geographic insights
- 🎯 Implement real-time churn alerts for VIP user segments

---

## 🛠️ Technical Implementation

### Prerequisites

```bash
pip install pandas numpy sqlalchemy psycopg2-binary seaborn matplotlib plotly scikit-learn scipy streamlit python-dotenv shap
```

### Data Pipeline

**1. Database Setup**
```bash
# Create PostgreSQL container
docker run --name spotify_db -e POSTGRES_PASSWORD=password -d postgres

# Configure connection (.env)
DATABASE_URL=postgresql://user:password@localhost/spotify_db
```

**2. Data Import**
```python
from sqlalchemy import create_engine

engine = create_engine(os.getenv("DATABASE_URL"))
with engine.begin() as conn:
    df.to_sql('spotify_users', conn, if_exists='append', index=False)
```

**3. Feature Engineering**
```python
# Calculate derived metrics
df['ads_per_listening_hour'] = (df['ads_listened_per_week'] * 60) / (7 * df['listening_time'])
df['daily_engagement'] = df['songs_played_per_day'] / df['skip_rate'].replace(0, 1)
```

### Model Development

**1. Exploratory Data Analysis**
- Validate data ranges and integrity
- Detect duplicates and null values
- Segment users by demographics and behavior
- Generate correlation and distribution visualizations

**2. Model Training**
```python
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

model = RandomForestClassifier(n_estimators=100, max_depth=15, random_state=42)
model.fit(X_train, y_train)
```

**3. Model Evaluation**
- **Precision:** Of all users predicted to churn, how many actually do?
- **Recall:** Of all users who actually churn, how many are correctly identified?
- **PR-AUC:** 0.2818 (optimal among tested models for imbalanced data)

**4. SHAP Interpretation**
```python
import shap

explainer = shap.TreeExplainer(model)
shap_values = explainer.shap_values(X_test)

shap.summary_plot(shap_values, X_test, plot_type="bar")
```

### Dashboard & Visualization

**Tools:** Power BI / Tableau / Streamlit

**Interactive Components:**
- Churn rate trends by geography, age, subscription type
- Feature importance visualizations
- Segment-specific KPIs and drill-down capabilities
- Churn prediction confidence intervals
- Geographic heatmaps

---

## 📁 Project Structure

```
spotify-churn-analysis/
├── data/
│   └── sspotify_churn_dataset.csv
├── notebooks/
│   ├── EDA.ipynb                    # Exploratory Data Analysis
│   └── model.ipynb                  # Feature creation & encoding, Model training & evaluatio, SHAP feature importance
├── sql/
│   ├── create_schema.sql            
│   ├── createe_views.sql      
│   └── EDA.sql             
├── dashboard/
│   └── spotify_churn_dashboard.pbix             # Interactive dashboard
│
└── README.md
```

---

## 🎯 Model Selection

**Why Classification?**

The problem is modeled as binary classification (churn / no-churn) rather than regression because the business objective is to identify high-risk users for immediate retention outreach, not predict exact churn timing.

**Why Random Forest?**

- **PR-AUC Score:** 0.2818 (highest among tested models)
- **Imbalanced Data Handling:** Effectively manages typical churn scenarios where positive class is rare
- **Interpretability:** Feature importance easily extracted; SHAP values enable explanation
- **Robustness:** Handles non-linear relationships and feature interactions

---

## 📋 Skills Demonstrated

This project showcases a complete analytics workflow:

| Skill | Application |
|-------|-------------|
| **Data Engineering** | SQL, PostgreSQL, ETL pipelines, data cleaning |
| **Data Analysis** | Python (Pandas, NumPy), statistical testing, EDA |
| **Feature Engineering** | Derived metrics, categorical encoding, normalization |
| **Machine Learning** | Random Forest, classification, model evaluation |
| **Model Interpretability** | SHAP analysis, feature importance, business translation |
| **Visualization** | Dashboarding, interactive reporting, storytelling |
| **Business Acumen** | Segment analysis, competitive strategy, ROI optimization |

---

## 📚 References

- **Dataset:** [Spotify Churn Analysis Dataset](https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis/data)
- **SHAP Documentation:** [shap.readthedocs.io](https://shap.readthedocs.io/)
- **Scikit-learn:** [scikit-learn.org](https://scikit-learn.org/)

---

## 📞 Contact

For questions or feedback regarding this analysis, please open an issue in the repository.

**Dataset Attribution:** Kaggle - Spotify Dataset for Churn Analysis

---

<div align="center">

**⭐ If you found this analysis valuable, please consider starring the repository!**

</div>

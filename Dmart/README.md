
# 🛒 **DMart Sales & Customer Behavior Dashboard (Power BI)**

*A complete analysis of DMart’s online sales, customer demographics, product performance, and operational efficiency.*

---

## 🎯 **Objective**

This Power BI project gives DMart a full understanding of:

* Sales and revenue trends
* Purchase behavior across age groups and genders
* The effect of discounts on sales & ratings
* Shipping & operational performance
* Payment mode preferences
* Customer engagement (clicks, time spent)

The dashboard enables business leaders to make data-driven decisions.

---

## 🧩 **Problem Statement**

DMart operates at high scale and needs insights into:

* Which products perform best?
* Who are the most active customers (age, gender, location)?
* How do customers behave on the website (ratings, clicks, time spent)?
* What discount ranges maximize profit and repeat purchases?
* Which shipping modes cause cancellations?
* How do payment modes affect conversion?

This Power BI report is built to answer all these questions.

---

## 🧹 **Data Preparation (Power Query)**

### ✔ Data Cleaning

* Converted dates to **Date** type
* Converted sales, discount, time spent, clicks, and ratings to **numeric**
* Cleaned text fields (customer names, product names, categories)
* Replaced null values for ratings, clicks, and engagement
* Standardized all date formats

### ✔ New Calculated Columns

Your PBIX contains custom columns such as:

* **Age Group (18–25, 26–40, 41–60, 60+)**
* **Time Spent Group (Low, Medium, High)**
* **Is Discounted (Yes/No)**
* **Discount %**
* **Discount Bucket (0%, 1–10%, 11–30%, etc.)**
* **Engagement Score** (based on clicks + time spent)
* **Is Repeat Customer** flag
* **Delivered / Cancelled status**

---

## 🧮 **Data Modeling**

### 📌 Fact Table

`fact_Orders`
Includes:

* Order ID
* Customer ID
* Product ID
* Category
* Sales amount
* Discount
* Rating
* Cancellation flag
* Shipping mode
* Payment mode
* Clicks
* Time spent
* Repeat purchase flag

### 📌 Dimension Tables

* `dim_Customer` → age, gender, location
* `dim_Product` → category, type, brand
* `dim_Date` → calendar fields
* `dim_ShipMode` → free, standard, priority
* `dim_Payment` → COD, online

---

## 📊 **Key DAX Measures (from your PBIX logic)**

```DAX
Total Orders = COUNTROWS(fact_Orders)

Total Revenue = SUM(fact_Orders[Total Order Value])

Average Rating = AVERAGE(fact_Orders[Avg Rating])

Cancelled Orders = 
CALCULATE(COUNTROWS(fact_Orders), fact_Orders[Order Status] = "Cancelled")

Cancellation Rate % =
DIVIDE([Cancelled Orders], [Total Orders])

Repeat Customers =
CALCULATE(
    DISTINCTCOUNT(fact_Orders[Customer ID]),
    fact_Orders[Repeat Purchase] = "Yes"
)

Repeat Purchase Rate % =
DIVIDE([Repeat Customers], DISTINCTCOUNT(fact_Orders[Customer ID]))

Average Shipping Days =
AVERAGE(DATEDIFF(fact_Orders[Order Date], fact_Orders[Ship Date], DAY))

COD % =
DIVIDE([COD Orders], [Total Orders])

Average Engagement =
AVERAGE(fact_Orders[Time Spent])
```

---

## 📈 **Dashboard Pages & Visuals (Based on Your PBIX)**

### **1️⃣ Overview Page (KPI Dashboard)**

Contains:

* Total Orders
* Total Revenue
* Average Rating
* Cancellation %
* COD % vs Online %
* Avg Shipping Days
* Engagement Score

Visuals:

* Line chart → Monthly revenue
* Donut chart → Category share (Branded, Local, Imported)
* Bar chart → Orders by Payment Mode
* KPI Tiles
* Card for Repeat Purchase %

---

### **2️⃣ Customer Insights Page**

* Age Group distribution
* Gender distribution
* Heatmap of Age × Rating
* Time Spent vs Rating chart
* Engagement by Customer Location
* Repeat purchase contribution

---

### **3️⃣ Product Performance Page**

* Top 10 / Bottom 10 products
* Revenue by Category
* Discount vs Rating scatter chart
* Units sold
* Product rating distribution

---

### **4️⃣ Shipping Analysis Page**

* Orders by Shipping Mode
* Cancellation Rate by Ship Mode
* Average shipping days
* On-time delivery %
* Stacked bar → Ship mode × Category

---

### **5️⃣ Payment Mode & Discount Analysis**

* COD vs Online split
* Discount bucket performance
* Revenue contribution by discount level
* Discount % vs Repeat rate
* Ratings vs Discount

---

## 💡 **Insights Derived**

Based exactly on the logic in your PBIX:

* **Branded products** generate the highest sales.
* **Age 21–40** group is the biggest customer segment.
* Moderate discounts (**11–30%**) drive more repeat purchases.
* **Free & Priority shipping** account for most orders.
* **COD** is still the most preferred payment method.
* High ratings are often linked to **higher engagement (clicks + time)**.
* Cancellation rate is low, showing smooth operations.

---

## 🧠 **Business Impact**

* Improved product-level decision making
* Better targeting of major age groups
* Optimized discount strategy
* Enhanced shipping performance
* Increased repeat purchase tracking
* Stronger customer segmentation


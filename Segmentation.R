#Data Preparation
import numpy as np, pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

customers = pd.read_csv('Mall_Customers.csv')

customers.head()

#EDA
# Check to see descriptive statistics
customers.describe()

# See the distribution of gender to recognize different distributions
sns.countplot(x='Gender', data=customers);
plt.title('Distribution of Gender');

# Histogram of ages
customers.hist('Age', bins=35);
plt.title('Distribution of Age');
plt.xlabel('Age');

# Histogram of ages by gender
plt.hist('Age', data=customers[customers['Gender'] == 'Male'], alpha=0.5, label='Male');
plt.hist('Age', data=customers[customers['Gender'] == 'Female'], alpha=0.5, label='Female');
plt.title('Distribution of Age by Gender');
plt.xlabel('Age');
plt.legend();

# Histogram of income
customers.hist('Annual Income (k$)');
plt.title('Annual Income Distribution in Thousands of Dollars');
plt.xlabel('Thousands of Dollars');

# Histogram of income by gender
plt.hist('Annual Income (k$)', data=customers[customers['Gender'] == 'Male'], alpha=0.5, label='Male');
plt.hist('Annual Income (k$)', data=customers[customers['Gender'] == 'Female'], alpha=0.5, label='Female');
plt.title('Distribution of Income by Gender');
plt.xlabel('Income (Thousands of Dollars)');
plt.legend();

# Create data sets by gender
male_customers = customers[customers['Gender'] == 'Male']
female_customers = customers[customers['Gender'] == 'Female']

# Print the average spending score for men and women
print(male_customers['Spending Score (1-100)'].mean())
print(female_customers['Spending Score (1-100)'].mean())

sns.scatterplot('Age', 'Annual Income (k$)', hue='Gender', data=customers);
plt.title('Age to Income, Colored by Gender');

sns.scatterplot('Age', 'Spending Score (1-100)', hue='Gender', data=customers);
plt.title('Age to Spending Score, Colored by Gender');

sns.heatmap(female_customers.corr(), annot=True);
plt.title('Correlation Heatmap - Female');

sns.heatmap(male_customers.corr(), annot=True);
plt.title('Correlation Heatmap - Male');

sns.lmplot('Age', 'Spending Score (1-100)', data=female_customers);
plt.title('Age to Spending Score, Female Only');

sns.scatterplot('Annual Income (k$)', 'Spending Score (1-100)', hue='Gender', data=customers);
plt.title('Annual Income to Spending Score, Colored by Gender');


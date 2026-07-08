--Query 1. Total patients

SELECT COUNT(*) as total_patients
FROM `healthcare_analysis.hospital_data`;

--Query 2. Average Billing
SELECT ROUND(AVG(Billing_Amount),2) as avg_billing
FROM `healthcare_analysis.hospital_data`;

--Query 3. Total Revenue
SELECT ROUND(SUM(Billing_Amount),2) as total_revenue
FROM `healthcare_analysis.hospital_data`;

--Query 4. Gender Distribution
SELECT Gender, 
       COUNT(*) as patients
FROM `healthcare_analysis.hospital_data`
GROUP BY Gender;

--Query 5. Admission type Distribution
SELECT Admission_Type, 
       COUNT(*) as patients_count
FROM `healthcare_analysis.hospital_data`
GROUP BY Admission_Type;

--Query 6. Medical Condition Distribution
SELECT Medical_Condition, 
       COUNT(*) as no_of_patients
FROM `healthcare_analysis.hospital_data`
GROUP BY Medical_Condition
ORDER BY no_of_patients DESC;

--Query 7. Average Age
SELECT ROUND(AVG(Age),2) as avg_age
FROM `healthcare_analysis.hospital_data`;

--Query 8. Average BMI
SELECT ROUND(AVG(BMI),2) as avg_bmi
FROM `healthcare_analysis.hospital_data`;

--Query 9. Revenue By Insurance Provider
select Insurance_Provider,
       round(sum(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Insurance_Provider
order by revenue desc

--Query 10. Top Hospitals By Revenue
select Hospital,
       round(sum(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Hospital
order by revenue desc
limit 10

--Query 11. Age Group Analysis
select Age_Group,
       count(*) as patients
from `healthcare_analysis.hospital_data`
group by Age_Group

--Query 12. Billing Category Analysis
select Billing_Category,
       count(*) as patients
from `healthcare_analysis.hospital_data`
group by Billing_Category

--Query 13.Average Billing By Disease
select Medical_Condition,
       ROUND(AVG(Billing_Amount),2) as avg_bill
from `healthcare_analysis.hospital_data`
group by Medical_Condition
order by avg_bill desc

--Query 14. Average Stay By Disease
select Medical_Condition,
       ROUND(AVG(Days_Hospitalised),2) as avg_stay
from `healthcare_analysis.hospital_data`
group by Medical_Condition
order by avg_stay desc

--Query 15. Revenue By Medical Condition
select Medical_Condition,
       ROUND(SUM(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Medical_Condition
order by revenue desc

--Query 16. Revenue By Gender
select Gender,
       ROUND(SUM(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Gender
order by revenue desc

--Query 17. Revenue By age group
select Age_Group,
       ROUND(SUM(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Age_Group
order by revenue desc

--Query 18. Revenue by Admission Type
select Admission_Type,
       ROUND(SUM(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Admission_Type

--Query 19. Most Common Disease by Gender
select Gender,Medical_Condition,
       COUNT(*) as patients
from `healthcare_analysis.hospital_data`
group by Gender, Medical_Condition
order by Gender, patients

--Query 20. Top 10 Doctor By Revenue
select Doctor,
       ROUND(SUM(Billing_Amount),2) as revenue
from `healthcare_analysis.hospital_data`
group by Doctor
order by revenue desc
limit 10

--Query 21. Disease Ranking
select Medical_Condition,
       count(*) as patients,
       dense_rank() over(order by count(*) desc) as disease_rnk
from `healthcare_analysis.hospital_data`
group by Medical_Condition

--Query 22. Hospital Revenue Ranking
select Hospital,
       round(sum(Billing_Amount),2) as revenue,
       dense_rank() over(order by sum(Billing_Amount) desc) as hospital_rnk
from `healthcare_analysis.hospital_data`
group by Hospital

--Query 23. Above Average Billing Patients
select * 
from `healthcare_analysis.hospital_data`
where Billing_Amount > (
  select AVG(Billing_Amount)
  from `healthcare_analysis.hospital_data`
)

--Query 24. Insurance Market Share
select Insurance_Provider,
       ROUND(SUM(Billing_Amount),2) as total_revenue,
       ROUND(SUM(Billing_Amount)*100/
       (select sum(Billing_Amount) from `healthcare_analysis.hospital_data`),2) as revenue_pct
from `healthcare_analysis.hospital_data`
group by Insurance_Provider
order by total_revenue desc

--Query 25. Hospital Revenue CTE
with revenue_cte as
(
  select Hospital,
       ROUND(SUM(Billing_Amount),2) as revenue
  from `healthcare_analysis.hospital_data`
  group by Hospital
)

select *,
dense_rank() over(order by revenue desc) as hospital_rnk
from revenue_cte













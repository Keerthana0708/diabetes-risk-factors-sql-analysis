#Diabetes Prevalence by Gender#
select gender, count(*) as patient_count, sum(diabetes) as diabetes_count, 
round(sum(diabetes)*100.0/count(*),2) as diabetes_percenage
from diabetes_prediction
group by gender
order by diabetes_percenage desc;


#Percentage of Diabetic Individuals in the Dataset#
select count(*) as total_patients, sum(diabetes) as diabetes_count,
round(sum(diabetes)*100/(select count(*) from diabetes_prediction),2) as diabetic_percentage
from diabetes_prediction;


#average BMI of diabetic vs. non-diabetic individuals#
select
case when diabetes=1 then 'Diabetic' else 'Non-Diabetic'
end as diabetes_status,
round(avg(bmi),2) as avg_bmi from diabetes_prediction
group by diabetes;


#average HbA1c level for diabetic vs. non-diabetic individuals#
select case when diabetes=1 then 'Diabetic' else 'Non-Diabetic'
end as diabetes_status,round(avg(HbA1c_level),2) as avg_heamoglobin from diabetes_prediction
group by diabetes;


#average glucose level for diabetic vs. non-diabetic individuals#
select 
case when diabetes=1 then 'Diabetic' else 'Non-Diabetic'
end as diabetes_status
,round(avg(blood_glucose_level),2) as avg_glucose_level from diabetes_prediction
group by diabetes;


# Diabetes Prevalence by Age Group#
SELECT 
    age_group,
    COUNT(*) AS total,
    SUM(diabetes) AS diabetic_count,
    ROUND(SUM(diabetes) * 100.0 / COUNT(*), 2) AS diabetes_rate 
    FROM(
        SELECT CASE 
            WHEN age BETWEEN 20 AND 29 THEN '20-29'
            WHEN age BETWEEN 30 AND 39 THEN '30-39'
            WHEN age BETWEEN 40 AND 49 THEN '40-49'
            WHEN age BETWEEN 50 AND 59 THEN '50-59'
            WHEN age >= 60 THEN '60+'
            ELSE 'Under 20'
        END AS age_group,
        diabetes
    FROM diabetes_PREDICTION) SUB
GROUP BY age_group
ORDER BY diabetes_rate DESC;



# smoking history affect diabetes prevalence#
select smoking_history,count(*) as total_patients,sum(diabetes) as diabetes_count,
round(sum(diabetes)*100.0/count(*),2) as diabetes_percentage from diabetes_prediction
group by smoking_history
order by diabetes_percentage desc;



#diabetes rate among individuals with heart disease or hypertension#
select 'hypertension' as problem,count(*) as total_patients, 
sum(diabetes) as diabetes_count,
round(sum(diabetes)*100/count(*),2) as diabetes_percentage from diabetes_prediction
where hypertension=1
union
select 'heart_disease' as problem,count(*) as total_patients, 
sum(diabetes) as diabetes_count,
round(sum(diabetes)*100/count(*),2) as diabetes_percentage from diabetes_prediction
where heart_disease=1;









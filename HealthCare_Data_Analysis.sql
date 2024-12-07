
--Creating Database names HealthCare
CREATE DATABASE [HealthCare]

--Selecting Database HealthCare to query
USE HealthCare;

select * from patient_data;

desc dbo.patient_data;

-- 1.  Counting Total Record in Database
select COUNT(*)[No Of Patients] from patient_data;

-- 2. Finding maximum age of patient admitted.
select max(Age) as [Maximum Age] from patient_data;

--3. Finding average age of patient admitted
select round(avg(Age),0) [Average Age] from patient_data;

-- 4. Calculating Patients Hospitalized Age-wise from Maximum to Minimum
select Age,COUNT(Age) as [Total Patients]
from patient_data
group by Age
order by Age DESC;

-- 5. Calculating Maximum Count of patients on basis of total patients hospitalized with respect to age.
select Age,COUNT(Age) as [Total]
from patient_data
group by Age
order by Total DESC,Age DESC

--6. Ranking Age on no of petients hospitalized
select Age,COUNT(Age) as Total, DENSE_RANK() over(order by COUNT(Age) DESC) as Ranking_Admitted 
from patient_data
group by Age
Having COUNT(Age) > Avg(Age)

-- 7. Finding Count of Medical Condition of patients and lisitng it by maximum no of patients.
select Medical_Condition, COUNT(Medical_Condition) as [Total Patients]
from patient_data
group by Medical_Condition
order by COUNT(Medical_Condition) DESC;

-- 8. Finding Rank & Maximum number of medicines recommended to patients based on Medical Condition pertaining to them.
select * from patient_data;
select Medical_Condition,Medication,COUNT(Medication)[Max no Medicines recommended],
RANK() over(partition by Medical_Condition order by COUNT(Medication) desc) as [Rank] from patient_data
group by Medical_Condition,Medication
order by Medical_Condition

-- 9. Most preffered Insurance Provide  by Patients Hospatilized
select Insurance_Provider, COUNT(Insurance_Provider) as [Most Insurance]
from patient_data 
group by Insurance_Provider
order by Count(Insurance_Provider)

-- 10. Finding out most preffered Hospital
select Hospital,COUNT(Hospital) as [Most Preferred], DENSE_RANK() over(order by COUNT(Hospital) DESC) as[Hospital Ranking]
from patient_data
group by Hospital
order by COUNT(Hospital) DESC;

-- 11. Identifying Average Billing Amount by Medical Condition.

select * from patient_data;

select Medical_Condition,Round(AVG(Billing_Amount),2)[Avg Bill Amount] 
from patient_data
group by Medical_Condition 
order by AVG(Billing_Amount)

-- 12. Finding Billing Amount of patients admitted and number of days spent in respective hospital.

select * from patient_data;

select Medical_Condition, PatientName, Hospital, DATEDIFF(DAY,Date_of_Admission,Discharge_date) as Number_of_Days, 
SUM(ROUND(Billing_Amount,2)) over(Partition by Hospital order by Hospital desc) as Total_Amount
from patient_data
order by Medical_Condition;

-- 13. Finding Total number of days sepnt by patient in an hospital for given medical condition
select PatientName,Medical_Condition,DATEDIFF(DAY,Date_of_Admission,Discharge_Date) as [Total Days Spent]
from patient_data 

-- 14. Finding Hospitals which were successful in discharging patients after having test results as 
--    'Normal' with count of days taken to get results to Normal
select Medical_Condition,Hospital,DATEDIFF(DAY,Date_of_Admission,Discharge_Date) as [Total Days Spend]
from patient_data
where Test_Results like 'Normal'
order by Medical_Condition,Hospital 

-- 15. Calculate number of blood types of patients which lies betwwen age 20 to 45

select Age,Blood_Type, COUNT(Blood_Type) as Count_Blood_Type
from patient_data
where Age between 20 and 45
group by Age,Blood_Type 
order by Count(Blood_Type) desc

-- 16. Find how many of patient are Universal Blood Donor and Universal Blood reciever

select distinct (select count(Blood_Type) from patient_data where Blood_Type in ('O-')) as Universal_Blood_Donor,
				(select count(Blood_Type) from patient_data where Blood_Type in ('AB+')) as Universal_Acceptor
from patient_data


-- 17. Provide a list of hospitals along with the count of patients admitted in the year 2024 AND 2025?
select distinct Hospital,COUNT(PatientName) as Total_Admitted from patient_data
where YEAR(Date_of_Admission) in (2012)
group by hospital
order by Total_Admitted desc

select distinct Hospital, Count(*) as Total_Admitted
FROM patient_data
WHERE YEAR(Date_of_Admission) IN (2021, 2022)
GROUP BY Hospital
ORDER by Total_Admitted DESC;


-- 18. Find the average, minimum and maximum billing amount for each insurance provider?

select Insurance_Provider,Round(AVG(Billing_Amount),0) as Avg_Amount,Round(max(Billing_Amount),0)as Max_Amount ,Round(Min(Billing_Amount),0) as Min_Amount
from patient_data
group by Insurance_Provider 

-- 19. Create a new column that categorizes patients as high, medium, or low risk based on their medical condition.
select PatientName,Medical_Condition,Hospital,Doctor,Test_Results,
CASE 
	WHEN Test_Results = 'Inconclusive' THEN 'Need more checkup / cannot be discharged'
	WHEN Test_Results = 'Normal' THEN 'Can get Discharge but need to follow prescribed medication timely'
	WHEN Test_Results = 'Abnormal' THEN 'Needs more attention and more tests'
	END AS 'Status'
from patient_data

# SQL-Data-Analysis-Healthcare-Project

The dataset is referred from Kaggle [here](https://www.kaggle.com/datasets/prasad22/healthcare-dataset).

The SQL queries performed on the Healthcare database yielded in-depth insights into key areas such as patient demographics, medical conditions, treatments, financial data, and hospital performance metrics. These results support data-driven decision-making and provide valuable perspectives for effective healthcare management and analysis.

### 1. Dataset insights & Intial Analysis
-The dataset was examined to obtain a thorough understanding of patient details and healthcare history. Queries included determining the total number of records, calculating the highest and average ages of admitted patients, and assessing patient demographics by age group.

### 2. Medical Conditions & Treatment Prescriptions
-In-depth analysis was conducted to identify common medical conditions, associated medications, and their occurrence rates. This data helps in understanding the distribution of health issues and the treatment patterns within the dataset.

### 3. Insurance Providers & Hospitals
-The project analyzed patient preferences for insurance companies and hospitals based on frequency. This information supports resource planning, provides insights into coverage choices, and helps assess the popularity of healthcare services across various institutions.

### 4. Cost Analysis & Length of Stay
-The financial aspects were analyzed by evaluating the average billing amounts for various medical conditions and calculating the total charges and length of hospital stays for patients across different facilities. This provides insights into cost structures, hospital efficiency, and the duration of patient care.

### 5. Blood Group Distribution & Donation Compatibility
-The analysis focused on the distribution of blood types across patient demographics, examining potential correlations between age groups and blood type frequencies. Furthermore, a stored procedure, 'Blood_Matcher,' was developed to identify compatible donors and recipients based on criteria such as blood type, age, and hospital affiliation or non-affiliation.

### 6. Yearly Admissions & Insurance Analysis
-The analysis focused on identifying hospitals with patient admissions in the years 2024 and 2025, while also examining billing trends across various insurance providers. This helps in understanding patient admission patterns and uncovering variations in billing practices among different insurance companies.

### 7. Patient Risk Assessment & Classification
-A new column was added to classify patients into high, medium, or low-risk categories based on their medical conditions and test results. This classification enables quick assessment of patient status and guides necessary follow-up actions.

## Each column in the dataset contains detailed information about the patient, their admission details, and the healthcare services received, making it ideal for various analytical and modeling tasks within the healthcare sector. Below is a concise overview of each column in the dataset:

### 1. Name: This column contains the patient's name as listed in the healthcare record.

### 2. Age: This column indicates the patient's age, measured in years, at the time of admission.

### 3. Gender: Indicates the gender of the patient, either "Male" or "Female."

### 4. Blood Type: This column represents the patient's blood type, which could be one of the common types (e.g., "A+", "O-", etc.).

### 5. Medical Condition: This column outlines the primary medical condition or diagnosis of the patient, such as "Diabetes," "Hypertension," "Asthma," and others.

### 6. Date of Admission: The date on which the patient was admitted to the healthcare facility.

### 7. Doctor: This column lists the name of the doctor overseeing the patient's care during their hospital admission.

### 8. Hospital: This column specifies the healthcare facility or hospital where the patient was admitted.

### 9. Insurance Provider: This column indicates the patient's insurance provider, which could be options like "Aetna," "Blue Cross," "Cigna," "UnitedHealthcare," or "Medicare."

### 10. Billing Amount: This column shows the total amount billed for the patient's healthcare services during their stay, expressed as a floating-point number.

### 11. Room Number: This column denotes the room number assigned to the patient during their admission.

### 12. Admission Type: This specifies the type of admission, such as "Emergency," "Elective," or "Urgent," which reflects the nature of the patient's admission.

### 13. Discharge Date: This column represents the date the patient was discharged from the healthcare facility, calculated based on the admission date and a random duration within a reasonable range.

### 14. Medication: This column lists the medications prescribed or administered to the patient during their admission, such as "Aspirin," "Ibuprofen," "Penicillin," "Paracetamol," or "Lipitor."

### 15. Test Results: This column outlines the results of medical tests conducted during the patient's stay, with possible values like "Normal," "Abnormal," or "Inconclusive."



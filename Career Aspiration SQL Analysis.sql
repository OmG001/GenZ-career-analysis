-- Milestone : 5 submission
-- 1.	What is the gender distribution of respondents from India?

SELECT 
    Gender, COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY Gender;

-- 2.	What percentage of respondents from India are interested in education abroad and sponsorship?

SELECT 
    (COUNT(CASE
        WHEN Pursue_Higher_Education IN ('Yes' , 'Needs a Sponser') THEN 1
    END) / COUNT(*)) * 100 AS PercentInterested
FROM
    tasktable
WHERE
    Country = 'IND';

-- 3.	What are the 6 top influences on career aspirations for respondents in India?

SELECT 
    Influencing_Factors, COUNT(*) AS InfluenceCount
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY Influencing_Factors
ORDER BY InfluenceCount DESC
LIMIT 6;

-- 4.	How do career aspiration influences vary by gender in India?

SELECT 
    Gender, Influencing_Factors, COUNT(*) AS InfluenceCount
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY Gender , Influencing_Factors
ORDER BY Gender , InfluenceCount DESC;

-- 5.	What percentage of respondents are willing to work for a company for at least 3 years?

SELECT 
    (COUNT(CASE
        WHEN Likely_to_work_for_3_years_or_more = 'Yes' THEN 1
    END) / COUNT(*)) * 100 AS PercentInterested
FROM
    tasktable
WHERE
    Country = 'IND';

-- 6.	How many respondents prefer to work for socially impactful companies?

SELECT 
    COUNT(CASE
        WHEN Likeliness_to_work_with_company_having_no_social_impact = 'No' THEN 1
    END) AS PreferWorking
FROM
    tasktable
WHERE
    Country = 'IND';

SELECT 
    COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
        AND Likeliness_to_work_with_company_having_no_social_impact = 'No';

-- 7.	How does the preference for socially impactful companies vary by gender?

SELECT 
    Gender,
    Likeliness_to_work_with_company_having_no_social_impact AS Preference,
    COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY Gender , Likeliness_to_work_with_company_having_no_social_impact
ORDER BY Gender , Likeliness_to_work_with_company_having_no_social_impact;

-- 8.	What is the distribution of minimum expected salary in the first three years among respondents?

SELECT 
    `Minimum_expected_monthly_salary_(For_first_3_years)` AS Salary_Distribution,
    COUNT(`Minimum_expected_monthly_salary_(For_first_3_years)`) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY `Minimum_expected_monthly_salary_(For_first_3_years)`
ORDER BY `Minimum_expected_monthly_salary_(For_first_3_years)`;

-- 9.	What is the expected minimum monthly salary in hand?

SELECT 
    `Min._expectations_of_Monthly_in_hand_salary(At_Start)` AS Salary_Distribution,
    COUNT(`Min._expectations_of_Monthly_in_hand_salary(At_Start)`) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY `Min._expectations_of_Monthly_in_hand_salary(At_Start)`
ORDER BY `Min._expectations_of_Monthly_in_hand_salary(At_Start)`;

-- 10.	What percentage of respondents prefer remote working?

SELECT 
    (COUNT(CASE
        WHEN Most_preferred_working_environment = 'Fully Remote' THEN 1
    END) / COUNT(*)) * 100 AS Preference_Percentage
FROM
    tasktable
WHERE
    Country = 'IND';

-- 11.	What is the preferred number of daily work hours?
 
SELECT 
    `Willing_work_hours_per_day?`,
    COUNT(*) AS Prefered_WorkingHours
FROM
    tasktable
WHERE
    Country = 'IND'
        AND `Willing_work_hours_per_day?` != 'NULL'
GROUP BY `Willing_work_hours_per_day?`
ORDER BY COUNT(*) DESC;

-- 12.	What are the common work frustrations among respondents?

SELECT 
    `Workplace_frustration_factors`,
    COUNT(*) AS Common_Frustrations_Factors
FROM
    tasktable
WHERE
    Country = 'IND'
        AND `Workplace_frustration_factors` != 'NULL'
GROUP BY `Workplace_frustration_factors`
ORDER BY COUNT(*) DESC;

-- 13.	How does the need for work-life balance interventions vary by gender?

SELECT 
    `Vacation_frequency_for_work-life_balance`,
    COUNT(*) AS Responses,
    gender
FROM
    tasktable
WHERE
    Country = 'IND'
        AND `Vacation_frequency_for_work-life_balance` != 'NULL'
GROUP BY Gender , `Vacation_frequency_for_work-life_balance`
ORDER BY Gender , COUNT(*) DESC;

-- 14.	How many respondents are willing to work under an abusive manager?

SELECT 
    `Tolerate_verbal_abuse_in_a_manager?`,
    COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
        AND `Tolerate_verbal_abuse_in_a_manager?` = 'Yes';

-- 15.	What is the distribution of minimum expected salary after five years?

SELECT 
    `Minimum_expected_monthly_salary_(After_5_years_from_now)` AS Salary_Distribution_After_5yrs,
    COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY `Minimum_expected_monthly_salary_(After_5_years_from_now)`
ORDER BY `Minimum_expected_monthly_salary_(After_5_years_from_now)`;
    
-- 16.	What are the remote working preferences by gender?

SELECT 
    Most_preferred_working_environment AS PreferedEnv,
    Gender,
    COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
        AND Most_preferred_working_environment = 'Fully Remote'
GROUP BY Gender;

-- 17.	What are the top work frustrations for each gender?

SELECT 
    Workplace_frustration_factors,
    Gender,
    COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
        AND Workplace_frustration_factors != 'NULL'
GROUP BY Gender , Workplace_frustration_factors
ORDER BY COUNT(*) DESC;

-- 18.	What factors boost work happiness and productivity for respondents?

SELECT 
    Workplace_satisfaction_factors, COUNT(*) AS Respondents
FROM
    tasktable
WHERE
    Country = 'IND'
GROUP BY Workplace_satisfaction_factors
ORDER BY COUNT(*) DESC;

-- 19. What percentage of respondents need sponsorship for education abroad?

SELECT 
    (COUNT(CASE
        WHEN Pursue_Higher_Education = 'Needs a Sponser' THEN 1
    END) / COUNT(*)) * 100 AS PrecentageOfRespondents
FROM
    tasktable
WHERE
    Country = 'IND';

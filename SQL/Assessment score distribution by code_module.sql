-- Assessment score distribution by code_module
SELECT 
    a.code_module,
    CASE
        WHEN sa.score BETWEEN 0 AND 50 THEN '0-50'
        WHEN sa.score BETWEEN 51 AND 75 THEN '51-75'
        WHEN sa.score BETWEEN 76 AND 90 THEN '76-90'
        WHEN sa.score > 90 THEN '91+'
        ELSE 'No Score' -- In case there are NULL or missing scores
    END AS score_group,
    COUNT(*) AS student_count
FROM 
    studentAssessment sa
JOIN 
    assessments a ON sa.id_assessment = a.id_assessment
GROUP BY 
    a.code_module, score_group
ORDER BY
    a.code_module, score_group;

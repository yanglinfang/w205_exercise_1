DROP TABLE HospitalEntity;
CREATE TABLE HospitalEntity AS SELECT DISTINCT HospitalName, CountryName, City, State, ZIPCode FROM Hospital;

DROP TABLE ProviderEntity;
CREATE TABLE ProviderEntity AS SELECT DISTINCT ProviderID, CountryName, City, State, ZIPCode FROM Hospital;

DROP TABLE SurveyEntity;
CREATE TABLE SurveyEntity AS SELECT ProviderID, HospitalName, City, State, CountryName, ZIPCode, 
CASE OverallRatingofHospitalDimensionScore 
WHEN '1 out Of 10' THEN 1 
WHEN '2 out of 10' THEN 2 
WHEN '3 out of 10' THEN 3 
WHEN '4 out of 10' THEN 4 
WHEN '5 out of 10' THEN 5 
WHEN '6 out of 10' THEN 6 
WHEN '7 out of 10' THEN 7 
WHEN '8 out of 10' THEN 8 
WHEN '9 out of 10' THEN 9 
WHEN '10 out of 10' THEN 10
ELSE -1 
END AS Score FROM  SurveysResponses ;

DROP TABLE HospitalScore;
CREATE TABLE HospitalScore AS
SELECT HospitalName, SUM(Score) AS SumScore, AVG(Score) AS AvgScore, variance(Score) AS VarianceScore FROM SurveyEntity 
WHERE Score >= 0
GROUP BY HospitalName; 

DROP TABLE StateScore;
CREATE TABLE StateScore AS
SELECT State, SUM(Score) AS SumScore, AVG(Score) AS AvgScore, variance(Score) AS VarianceScore FROM SurveyEntity 
WHERE Score >= 0
GROUP BY State; 


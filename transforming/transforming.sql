DROP TABLE HospitalEntity;
CREATE TABLE HospitalEntity AS SELECT DISTINCT HospitalName, CountryName, City, State, ZIPCode FROM Hospital;

DROP TABLE ProviderEntity;
CREATE TABLE ProviderEntity AS SELECT DISTINCT ProviderID, CountryName, City, State, ZIPCode FROM Hospital;

DROP TABLE SurveyEntity;
CREATE TABLE SurveyEntity AS SELECT ProviderID, HospitalName, City, State, CountryName, ZIPCode, OverallRatingofHospitalDimensionScore FROM SurveysResponses ;

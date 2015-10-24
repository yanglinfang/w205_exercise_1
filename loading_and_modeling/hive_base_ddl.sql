DROP TABLE [IF EXISTS] Hospital;
CREATE EXTERNAL TABLE Hospital
( 
ProviderID varchar(10),
HospitalName varchar(100),
Address varchar(100),
City varchar(50),
State varchar(10),
ZIPCode varchar(10),
CountryName varchar(30),
PhoneNumber varchar(30),
HospitalType varchar(50),
HospitalOwnership varchar(50),
EmergencyServices varchar(100)
)
row format SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
'separatorChar' = ',',
'quoteChar' = '"',
'escapeChar' = '\\'
)
stored as textfile
location '/user/lin/hdfs';

LOAD DATA LOCAL INPATH '/user/lin/hospital_compare/dataForEx1/hospital_noheader.csv'
OVERWRITE INTO TABLE Hospital;

DROP TABLE [IF EXISTS] EffectiveCare;
CREATE EXTERNAL TABLE EffectiveCare
( 
ProviderID varchar(10),
HospitalName varchar(100),
Address varchar(100),
City varchar(50),
State varchar(10),
ZIPCode varchar(10),
CountryName varchar(30),
PhoneNumber varchar(30),
Condition varchar(50),
MeasureID varchar(30),
MeasureName varchar(200),
Score varchar(100),
Sample varchar(30),
Footnote varchar(200),
MeasureStartDate varchar(20),
MeasureEndDate varchar(10)
)
row format SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
'separatorChar' = ',',
'quoteChar' = '"',
'escapeChar' = '\\'
)
stored as textfile
location '/user/lin/hdfs';

LOAD DATA LOCAL INPATH '/user/lin/hospital_compare/dataForEx1/effective_care_noheader.csv'
OVERWRITE INTO TABLE EffectiveCare;

DROP TABLE [IF EXISTS] SurveysResponses;
CREATE EXTERNAL TABLE SurveysResponses
(
ProviderID varchar(10),
HospitalName varchar(100),
Address varchar(100),
City varchar(50),
State varchar(10),
ZIPCode varchar(10),
CountryName varchar(30),
CommunicationWithNursesAchievementPoints varchar(30),
CommunicationWithNursesImprovementPoints varchar(30),
CommunicationWithNursesDimensionScore varchar(30),
CommunicationWithDoctorsAchievementPoints varchar(30),
CommunicationWithDoctorsImprovementPoints varchar(30),
CommunicationWithDoctorsDimensionScore varchar(30),
ResponsivenessofHospitalStaffAchievementPoints varchar(30),
ResponsivenessofHospitalStaffImprovementPoints varchar(30),
ResponsivenessofHospitalStaffDimensionScore varchar(30),
PainManagementAchievementPoints varchar(30),
PainManagementImprovementPoints varchar(30),
PainManagementDimensionScore varchar(30),
CommunicationaboutMedicinesAchievementPoints varchar(30),
CommunicationaboutMedicinesImprovementPoints varchar(30),
CommunicationaboutMedicinesDimensionScore varchar(30),
CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints varchar(30),
CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints varchar(30),
CleanlinessandQuietnessofHospitalEnvironmentDimensionScore varchar(30),
DischargeInformationAchievementPoints varchar(30),
DischargeInformationImprovementPoints varchar(30),
DischargeInformationDimensionScore varchar(30),
OverallRatingofHospitalAchievementPoints varchar(30),
OverallRatingofHospitalImprovementPoints varchar(30),
OverallRatingofHospitalDimensionScore varchar(30),
HCAHPSBaseScore varchar(30),
HCAHPSConsistencyScore varchar(30)
)
row format SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
'separatorChar' = ',',
'quoteChar' = '"',
'escapeChar' = '\\'
)
stored as textfile
location '/user/lin/hdfs';

LOAD DATA LOCAL INPATH '/user/lin/hospital_compare/dataForEx1/surveys_responses_noheader.csv'
OVERWRITE INTO TABLE SurveysResponses;

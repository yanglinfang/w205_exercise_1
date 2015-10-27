#Best hospital (does not consider variance)
SELECT * FROM HospitalScore SORT BY AvgScore DESC LIMIT 10; 

#Best hospital with score variance considered 
SELECT * FROM HospitalScore WHERE VarianceScore > 0 SORT BY AvgScore DESC LIMIT 10; 
# iris-sql-python-sample
Samples how to create InterSystems IRIS SQL Stored Procedures using Embedded Python

## Installation
1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/iris-sql-python-sample.git
```

2. Open a Docker terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container:

```
$ docker-compose up -d 
```

4. **For use Geopy with GetFullAddress SQL Stored Procedure:** Go to SQL Execution on Management Portal:

```
SELECT 
ID, City, Name, State, Street, Zip, dc_pythonsql.GetFullAddress(Street, City, State) As FullAddress 
FROM dc_pythonsql.Company
```

![Geopy](https://github.com/yurimarx/iris-sql-python-sample/raw/main/screen1.png "Geopy SQL Stored Procedure execution")
 

5. **For use Chronyk with GetHumanDate SQL Stored Procedure:** Go to SQL Execution on Management Portal:

```
SELECT 
ID, City, Name, State, Street, Zip, dc_pythonsql.GetHumanDate('yesterday') As Datetime      
FROM dc_pythonsql.Company
```

![Chronyk](https://github.com/yurimarx/iris-sql-python-sample/raw/main/screen2.png "Chronyk SQL Stored Procedure execution")

# Credits
- Geopy: https://geopy.readthedocs.io/en/stable/
- Chronyk: https://github.com/KoffeinFlummi/Chronyk


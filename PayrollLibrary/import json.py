import json

# Assuming your JSON data is in a string variable named json_data
json_data = '''
[
  {
    "EmployeeID": 1,
    "DepartmentID": 101,
    "FirstName": "John",
    "LastName": "Doe",
    "HourlyRate": 25.50
  },
  ...
  {
    "EmployeeID": 10,
    "DepartmentID": 110,
    "FirstName": "Barbara",
    "LastName": "Thomas",
    "HourlyRate": 31.50
  }
]
'''

# Parse the JSON data from the string
employees = json.loads(json_data)

# Access and print the data
for employee in employees:
    print(f"EmployeeID: {employee['EmployeeID']}, DepartmentID: {employee['DepartmentID']}, "
          f"FirstName: {employee['FirstName']}, LastName: {employee['LastName']}, "
          f"HourlyRate: {employee['HourlyRate']}")
from datetime import datetime


# Function to calculate days between two dates
def calculate_days_between(date1, date2):
    # Convert strings to date objects
    date_format = "%Y-%m-%d"
    start_date = datetime.strptime(date1, date_format)
    end_date = datetime.strptime(date2, date_format)

    # Calculate the difference in days
    difference = abs((end_date - start_date).days)
    return difference


# Input dates
date1 = input("Enter the first date (YYYY-MM-DD): ")
date2 = input("Enter the second date (YYYY-MM-DD): ")

# Calculate and print the difference
days_between = calculate_days_between(date1, date2)
print(f"The number of days between {date1} and {date2} is: {days_between} days")

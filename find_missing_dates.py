import os
import re
import sys
from datetime import datetime, timedelta


def find_missing_dates(folder_path, date_format):
    # Generate a regex pattern dynamically from the date format
    regex_format = date_format
    regex_format = regex_format.replace("%Y", r"(?P<year>\d{4})")
    regex_format = regex_format.replace("%y", r"(?P<year_short>\d{2})")
    regex_format = regex_format.replace("%m", r"(?P<month>\d{2})")
    regex_format = regex_format.replace("%d", r"(?P<day>\d{2})")
    date_pattern = re.compile(regex_format)

    # List to hold extracted dates
    found_dates = []

    count_files = len(os.listdir(folder_path))
    # Scan the folder for files and extract dates from filenames
    for filename in os.listdir(folder_path):
        match = date_pattern.search(filename)
        if match:
            try:
                # Replace short year with full year if found
                year = match.groupdict().get("year")
                year_short = match.groupdict().get("year_short")
                if not year and year_short:
                    year = f"20{year_short}"  # Assumes 21st century for short years

                # Build a date string based on the provided format
                date_string = filename[match.start() : match.end()]
                parsed_date = datetime.strptime(date_string, date_format).date()
                found_dates.append(parsed_date)
            except ValueError:
                # Skip invalid dates
                continue

    # Ensure we have found dates
    if found_dates:
        # Sort the dates
        found_dates = sorted(set(found_dates))

        # Determine the range
        start_date = found_dates[0]
        end_date = found_dates[-1]

        # Generate all dates in the range
        full_date_range = set(
            start_date + timedelta(days=i)
            for i in range((end_date - start_date).days + 1)
        )

        # Find missing dates
        missing_dates = sorted(full_date_range - set(found_dates))

        # Print results
        print("Missing dates:")
        for missing_date in missing_dates:
            print(missing_date)
        print(f"First found date: {start_date}")
        print(f"Last found date: {end_date}")
        print(f"Missing percent: {round((len(missing_dates) / count_files)* 100,2)}%")
        print(f"Missing count: {len(missing_dates)}")

    else:
        print("No valid dates found in filenames.")


if __name__ == "__main__":
    # Check for correct number of arguments
    if len(sys.argv) != 3:
        print("Usage: python script.py <folder_path> <date_format>")
        print("Example date formats: '%Y-%m-%d', '%d-%m-%Y', '%m_%d_%Y', etc.")
        sys.exit(1)

    # Get arguments
    folder_path = sys.argv[1]
    date_format = sys.argv[2]

    # Run the function
    find_missing_dates(folder_path, date_format)

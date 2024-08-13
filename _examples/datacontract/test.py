import boto3
import pandas as pd
import s3fs

# Set up S3 filesystem
s3 = s3fs.S3FileSystem(anon=False)

# Define the S3 path, replace {model} with the actual model name
s3_path = "s3://datacontract-example-orders-latest/data/line_items/*.json"

# List all JSON files in the directory
file_list = s3.glob(s3_path)

# Initialize an empty list to store DataFrames
dfs = []

# Iterate over the file list and read each JSON file
for file in file_list:
    # Read the JSON file into a pandas DataFrame
    df = pd.read_json(s3.open(file), lines=True)
    dfs.append(df)

# Concatenate all DataFrames into a single DataFrame
combined_df = pd.concat(dfs, ignore_index=True)

# Display the combined DataFrame
print(combined_df)


import pandas as pd
import numpy as np
import math
import datetime as datetime
import calendar
import time

# read raw data and format

age_client = pd.read_csv('https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/CLIENT_191102.tsv',sep='\t')
date_client = pd.read_csv('https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/ENTRY_EXIT_191102.tsv',sep='\t')
survey_client = pd.read_csv('https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/EE_UDES_191102.tsv',sep='\t')
disability_in = pd.read_csv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/DISABILITY_ENTRY_191102.tsv", sep = '\t')
disability_out = pd.read_csv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/DISABILITY_EXIT_191102.tsv", sep = '\t')

# we will merge for the disability in and out and then finally merge those two with the survey_client

merged_data = pd.merge(disability_in, disability_out, on = "Client ID", how = "right")

#next we will format the data and keep variables of interest

age_client_keep = age_client[['Client ID', 'Client Age at Entry', 'Client Gender',
       'Client Primary Race', 'Client Ethnicity', 'Client Veteran Status']]
age_client_keep.columns = ['id', 'age_at_entry', 'gender', 'race', 'ethnicity', 'veteran_status']

age_client_keep = age_client_keep.drop_duplicates(subset = "id")
age_client_keep = age_client_keep.dropna(how = 'any')
age_client_keep.head()

## we clean up data for date_client in order to calculate number of days stayed for each person
date_client["entry_date"] = pd.to_datetime(date_client['Entry Date'], format='%m/%d/%Y')
date_client['exit_date'] =  pd.to_datetime(date_client['Exit Date'], format='%m/%d/%Y')
date_client["diff_date"] = date_client['exit_date'] - date_client['entry_date']
date_client['diff_date'] = date_client['diff_date'] / np.timedelta64(1, 'D') 
final_date_client = date_client[['EE UID','Client ID','Destination','entry_date','exit_date','diff_date']]
final_date_client.head()

export_csv = final_date_client.to_csv (r'C:\Users\Helal\Desktop\BIOS 611\cleandata', index = None, header=True)
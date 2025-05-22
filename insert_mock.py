import os
import pandas as pd
from sqlalchemy import create_engine
import glob

# Настройки подключения
DB_USER = 'zloyaloha'
DB_PASS = '12341234'
DB_NAME = 'lab2BDA'
DB_HOST = 'localhost'

engine = create_engine(f'postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}')

all_files = glob.glob("data/*.csv")
dfs = []
for file_path in all_files:
    df = pd.read_csv(file_path)
    splitted = file_path.split(".")[0].split(" ")

    file_num = int(splitted[1][1]) if len(splitted) > 1 else 0

    id_columns = ['id', 'sale_customer_id', 'sale_seller_id', 'sale_product_id']
    for col in id_columns:
        df[col] = df[col] + file_num * 1000

    dfs.append(df)

combined_df = pd.concat(dfs, ignore_index=True)
combined_df.to_sql('mock_data', engine, if_exists='replace', index=False)
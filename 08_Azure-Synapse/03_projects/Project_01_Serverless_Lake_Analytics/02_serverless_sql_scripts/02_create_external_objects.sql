-- External objects
CREATE DATABASE lake_db;
GO

CREATE EXTERNAL DATA SOURCE adls_src
WITH ( LOCATION = 'https://<storage>.dfs.core.windows.net/' );

CREATE EXTERNAL FILE FORMAT parquet_format
WITH ( FORMAT_TYPE = PARQUET );

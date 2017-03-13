-- campaign_desc_raw table transformation script
-- Add the create_time into cam

-- Raw data from Hive table using HCatLoader.
raw_data = LOAD '$input' USING org.apache.hive.hcatalog.pig.HCatLoader();

-- Add create_time using built in Pig ToString function.
add_create_time = FOREACH raw_data GENERATE *,ToString(CurrentTime(),'yyyy-MM-dd hh:mm:ss') AS create_time;

--DUMP add_create_time;

-- Store output into HDFS folder
STORE B into '$output' USING PigStorage();
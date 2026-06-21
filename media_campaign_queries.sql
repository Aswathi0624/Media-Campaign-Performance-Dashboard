CREATE DATABASE MediaCampaign;
USE MediaCampaign;
CREATE TABLE Campaign_Data (
    Campaign_ID VARCHAR(50),
    Campaign_Type VARCHAR(100),
    Channel_Used VARCHAR(100),
    Impressions INT,
    Clicks INT,
    Leads INT,
    Conversions INT,
    Revenue DECIMAL(15,2),
    Acquisition_Cost DECIMAL(15,2),
    ROI DECIMAL(10,2),
    Date DATE
);
select* from Campaign_Data;
#total revenue
SELECT SUM(Revenue) AS Total_Revenue FROM Campaign_Data;
#total cost
SELECT SUM(Acquisition_Cost) AS Total_Cost FROM Campaign_Data;
# Campaign-wise Revenue
SELECT Campaign_Type,SUM(Revenue) AS Revenue FROM Campaign_Data GROUP BY Campaign_Type;
# Channel Performance
SELECT Channel_Used, SUM(Revenue) AS Revenue, SUM(Conversions) AS Conversions FROM Campaign_Data GROUP BY Channel_Used;
# Top 10 Campaigns
SELECT Campaign_ID, Revenue,ROI FROM Campaign_Data ORDER BY Revenue DESC LIMIT 10;
# Conversion Rate
SELECT ROUND(SUM(Conversions) * 100.0 / SUM(Leads), 2) AS Conversion_Rate FROM Campaign_Data;

CREATE VIEW Campaign_Summary AS
SELECT
    Campaign_Type,
    Channel_Used,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Avg_ROI
FROM Campaign_Data
GROUP BY Campaign_Type, Channel_Used;

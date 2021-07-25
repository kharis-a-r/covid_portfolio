# Covid-19 Data
---
So I took the data from https://ourworldindata.org/coronavirus and put into a database. I then do some commands to get information from said database

1. Insert the data to databases
Here is the most exhausting process since I was still exploring how to insert tabular data from csv into databases. The best way that I found working was to use "load data local infile" command but this was long process since I have to make sure that the column from csv fit exactly into my database column. However, it worked!
2. Add date feature
For some reason, the date column provided was not identified as date type by SQL. I have to extract the date and format it into suitable date format.
3. Information extraction
I then did some information extraction from the database, such as total population, total death (globally and per country), infection rate per country, new cases and new deaths globally per day, and vaccine rate

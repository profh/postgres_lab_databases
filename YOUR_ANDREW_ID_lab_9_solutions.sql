-- Lab 9 Solutions for [YOUR ANDREW ID HERE]
---------------------------------------------
--
-- Part 1: Create views 
-- Code to create view #1 below:  





--
-- Test view #1 with query below:  (optional; on your own)
select title,crime,solved from case_crimes_view where batman_involved=true;
--  
-- -----------------------
-- Code to create view #2





--
-- Test view #2 with query below:   (optional; on your own)
select last_name, first_name, alias, crime, title from criminal_cases_view where crime ILIKE '%arson%';
--
--
-- =====================================
-- Part 2: Create functions and triggers
-- 
-- #1: Create a sql function that returns the first_name, last_name, unit name, case title 
--     and crime name of all officers assigned to a particular type of crime (e.g., 'murder')
-- 1A - Base query to be used in function below:  (also test in autograder with 'murder' as crime) 





--
-- 1B - Create function using query above using language sql:









--
-- #2: Create a trigger that will update the summary table 'case_summary' whenever the cases table 
--     is modified (i.e., handle updates, inserts and deletes)
-- 2A - create a trigger function that updates the summary table









-- 2B - create the actual trigger that call this function whenever a case is updated, or a new 
--      case is inserted or one is deleted from the table





--
--
-- =====================================
-- Part 3: Fuzzy searching  (submit via autograder; record below for your own records; optional)
--
-- #1: Using the soundex function, find all the criminals who have a first name sounding like 'Clyde'.
--     List the last names and first names and sort the list in that order.




-- #2: Repeat the query above using the dmetaphone function this time instead of soundex.




-- #3: Using the levenshtein function, find all six members of the infamous 'McGrady' family 
--     List the last names and first names and sort the list in that order.




-- #4: Find all seven members of the infamous 'Gelfeld' crime family.  Just as the McGrady family 
--     members had first names all starting J, the Gelfelds' first names all start with K (led by 
--     their notorious leader, Kenny). List the last names and first names and sort the list in that order. 




-- #5: Using the dmetaphone function, find any criminals with a first or last name or alias sounding like 'Jack'.
--     List the last names, first names and aliases and sort the list in that order.




-- #6: Rework the previous search to cast a broader but still appropriate net.  See sheet for records 
--     that must be returned.




-- #7: Rework the previous search find similarity levels using the similarity function.




-- #8: Rework the previous search using both similarity and dmetaphone.





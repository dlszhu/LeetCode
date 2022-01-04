# Write your MySQL query statement below

SELECT
  *
FROM
  Users
WHERE
  mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';
  
 # ^[a-zA-Z] : The email must start with an alphanumeric letter (i.e., not digit)
 # [a-zA-Z0-9_.-]* :
 # The next zero or more characters must be either alphanumeric (letters a-z, A-Z, or digits 0-9) or a _ or . or -
 # the * character refers to the matching of zero or more characters as opposed to, say, +, which typically refers to one or more characters
 # @leetcode[.]com$ :
 # @leetcode: The next sequence of characters must exactly match @leetcode
 # [.]: The . character within a [] pair does not have special meaning so it must be matched exactly after @leetcode
 # com$: The string must end with com
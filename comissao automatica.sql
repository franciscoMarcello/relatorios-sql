SELECT 
Case
WHEN $[$38.15.1] BETWEEN '1,000000' AND '1,999999' THEN 11
WHEN $[$38.15.1] BETWEEN '2,000000' AND '2,999999' THEN 10
WHEN $[$38.15.1] BETWEEN '3,000000' AND '3,999999' THEN 9
WHEN $[$38.15.1] BETWEEN '4,000000' AND '4,999999' THEN 8
WHEN $[$38.15.1] BETWEEN '5,000000' AND '5,999999' THEN 7
WHEN $[$38.15.1] BETWEEN '6,000000' AND '6,499999' THEN 6.2
WHEN $[$38.15.1] BETWEEN '6,500000' AND '6,999999' THEN 6
WHEN $[$38.15.1] BETWEEN '7,000000' AND '7,499999' THEN 5.8
WHEN $[$38.15.1] BETWEEN '7,500000' AND '7,999999' THEN 5.4
WHEN $[$38.15.1] BETWEEN '8,000000' AND '8,499999' THEN 5
WHEN $[$38.15.1] BETWEEN '8,500000' AND '8,999999' THEN 4.6
WHEN $[$38.15.1] BETWEEN '9,000000' AND '9,499999' THEN 4.2
WHEN $[$38.15.1] BETWEEN '9,500000' AND '9,999999' THEN 4.0
WHEN $[$38.15.1] BETWEEN '10,000000' AND '10,4999999' THEN 3.8
WHEN $[$38.15.1] BETWEEN '10,500000' AND '10,9999999' THEN 3.6
WHEN $[$38.15.1] BETWEEN '11,000000' AND '11,4999999' THEN 3.4
WHEN $[$38.15.1] BETWEEN '11,500000' AND '11,9999999' THEN 3.2
WHEN $[$38.15.1] BETWEEN '12,000000' AND '12,000000' THEN 3
WHEN $[$38.15.1] BETWEEN '15,000000' AND '15,000000' THEN 0
ELSE 12
END
FROM DUMMY
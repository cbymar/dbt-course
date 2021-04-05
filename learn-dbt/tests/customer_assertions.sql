
WITH sum_c_acctbal AS 
(SELECT 
	SUM(c_acctbal) AS acctbal_sum
FROM {{ ref('playing_with_tests') }}) 

SELECT * FROM sum_c_acctbal WHERE acctbal_sum > {{ var('max_acctbal_sum')}}

SELECT MAX(row_index) , t.*, RPAD('', LN(to_level), '*') AS bar
	 FROM ( SELECT
	  CASE
	   WHEN @index IS NULL THEN 
	   		@index:= 1 
	   	ELSE
	   	 @index:= @index+1 
	  END 
	 AS row_index, 
 ROUND( UNIX_TIMESTAMP(when_utc)/(3600*6), 0) AS bucket , 
 to_level, dog_id, when_utc FROM
  battery_levels WHERE `dog_id`=56116 ) t GROUP BY bucket;
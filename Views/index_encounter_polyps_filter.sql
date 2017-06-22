SELECT *
FROM gldata.colonoscopies AS coln
WHERE coln.patient_id 
IN (	SELECT colonoscopies.patient_id 		
			FROM gldata.colonoscopies 
			WHERE index='T'
    		AND colonoscopies.total_polyps_reported >= 1) /* FILTER ON TOTAL POLYPS AT INDEX */
ORDER BY coln.patient_id,coln.encounter_date;

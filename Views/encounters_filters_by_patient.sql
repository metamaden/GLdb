 SELECT patients.patient_id,
    temppat.num_encounters,
    temppat.encounter_dates,
    temppat.encounter_ages,
    temppat.polyps_recorded_by_encounter,
    temppat.total_polyps_reported
   FROM gldata.patients,
    ( SELECT colnage.patient_id,
            colnage.patient_dob,
            array_agg(colnage.age_yrs) AS encounter_ages,
            array_agg(colnage.encounter_date) AS encounter_dates,
            array_agg(colnage.n_polyps_recorded) AS polyps_recorded_by_encounter,
            count(colnage.encounter_date) AS num_encounters,
            array_agg(colnage.total_polyps_reported) AS total_polyps_reported
           FROM ( SELECT glcol.patient_id,
                    patients_1.dob AS patient_dob,
                    age(glcol.encounter_date::timestamp with time zone, patients_1.dob::timestamp with time zone) AS age,
                    date_part('year'::text, age(glcol.encounter_date::timestamp with time zone, patients_1.dob::timestamp with time zone)) AS age_yrs,
                    glcol.encounter_date,
                    glcol.total_polyps_reported,
                    n_polyps.n_polyps AS n_polyps_recorded
                   FROM gldata.patients patients_1,
                    gldata.colonoscopies glcol,
                    ( SELECT colonoscopies.patient_id,
                            colonoscopies.encounter_date,
                            count((polyps.encounter_date || '-'::text) || polyps.patient_id::text) AS n_polyps
                           FROM gldata.colonoscopies
                             LEFT JOIN gldata.polyps ON colonoscopies.patient_id::text = polyps.patient_id::text AND colonoscopies.encounter_date = polyps.encounter_date
                          GROUP BY colonoscopies.patient_id, colonoscopies.encounter_date
                          ORDER BY colonoscopies.patient_id, colonoscopies.encounter_date) n_polyps
                  WHERE patients_1.patient_id::text = glcol.patient_id::text AND patients_1.patient_id::text = n_polyps.patient_id::text AND glcol.encounter_date = n_polyps.encounter_date) colnage
          WHERE colnage.age_yrs >= 20::double precision AND colnage.n_polyps_recorded >= 1
          GROUP BY colnage.patient_id, colnage.patient_dob) temppat
  WHERE patients.patient_id::text = temppat.patient_id::text AND temppat.num_encounters >= 1;

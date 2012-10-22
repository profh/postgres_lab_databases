-- fkeys for cases
ALTER TABLE cases ADD CONSTRAINT cases_crime_id_fk FOREIGN KEY (crime_id)
REFERENCES crimes (crime_id) ON DELETE RESTRICT ON UPDATE CASCADE;


-- fkeys for assignments
ALTER TABLE assignments ADD CONSTRAINT assignments_case_id_fk FOREIGN KEY (case_id)
REFERENCES cases (case_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE assignments ADD CONSTRAINT assignments_officer_id_fk FOREIGN KEY (officer_id)
REFERENCES officers (officer_id) ON DELETE RESTRICT ON UPDATE CASCADE;


-- fkeys for suspects
ALTER TABLE suspects ADD CONSTRAINT suspects_case_id_fk FOREIGN KEY (case_id)
REFERENCES cases (case_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE suspects ADD CONSTRAINT suspects_criminal_id_fk FOREIGN KEY (criminal_id)
REFERENCES criminals (criminal_id) ON DELETE RESTRICT ON UPDATE CASCADE;


-- fkeys for officers
ALTER TABLE officers ADD CONSTRAINT officers_unit_id_fk FOREIGN KEY (unit_id)
REFERENCES units (unit_id) ON DELETE RESTRICT ON UPDATE CASCADE;

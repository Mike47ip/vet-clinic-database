CREATE TABLE patient_medical_history (
    id SERIAL PRIMARY KEY,
    patient_id INT,
    medical_history_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);


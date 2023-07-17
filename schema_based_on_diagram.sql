CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(25),
  FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices (
id SERIAL PRIMARY KEY,
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

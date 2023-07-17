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
medical_history_id INT PRIMARY KEY,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
id SERIAL PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
FOREIGN KEY (invoice_id) REFERENCES invoices(id),
FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(25),
  name VARCHAR(25) 
)

CREATE TABLE medical_histories_treatments (
  medical_histories_id INT,
  treatments_id INT,
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatments_id) REFERENCES treatments(id)
)
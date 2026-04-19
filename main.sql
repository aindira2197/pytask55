CREATE TABLE Workers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    department VARCHAR(100),
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE TABLE Tasks (
    id INT PRIMARY KEY,
    worker_id INT,
    task_name VARCHAR(255),
    task_description TEXT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (worker_id) REFERENCES Workers(id)
);

CREATE TABLE Task_History (
    id INT PRIMARY KEY,
    task_id INT,
    worker_id INT,
    change_date DATE,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    FOREIGN KEY (task_id) REFERENCES Tasks(id),
    FOREIGN KEY (worker_id) REFERENCES Workers(id)
);

CREATE INDEX idx_Workers_id ON Workers(id);
CREATE INDEX idx_Tasks_worker_id ON Tasks(worker_id);
CREATE INDEX idx_Task_History_task_id ON Task_History(task_id);

INSERT INTO Workers (id, name, surname, email, phone_number, department, job_title, salary, hire_date)
VALUES 
(1, 'John', 'Doe', 'john@example.com', '1234567890', 'Sales', 'Sales Manager', 50000.00, '2020-01-01'),
(2, 'Jane', 'Doe', 'jane@example.com', '9876543210', 'Marketing', 'Marketing Manager', 60000.00, '2020-02-01'),
(3, 'Bob', 'Smith', 'bob@example.com', '5551234567', 'IT', 'IT Manager', 70000.00, '2020-03-01');

INSERT INTO Tasks (id, worker_id, task_name, task_description, start_date, end_date, status)
VALUES 
(1, 1, 'Sales Report', 'Create sales report for Q1', '2022-01-01', '2022-01-31', 'In Progress'),
(2, 2, 'Marketing Campaign', 'Create marketing campaign for new product', '2022-02-01', '2022-02-28', 'In Progress'),
(3, 3, 'System Update', 'Update company systems', '2022-03-01', '2022-03-31', 'In Progress');

INSERT INTO Task_History (id, task_id, worker_id, change_date, old_status, new_status)
VALUES 
(1, 1, 1, '2022-01-15', 'New', 'In Progress'),
(2, 2, 2, '2022-02-15', 'New', 'In Progress'),
(3, 3, 3, '2022-03-15', 'New', 'In Progress');

SELECT * FROM Workers;
SELECT * FROM Tasks;
SELECT * FROM Task_History;

UPDATE Tasks SET status = 'Completed' WHERE id = 1;
UPDATE Task_History SET new_status = 'Completed' WHERE task_id = 1;

DELETE FROM Task_History WHERE task_id = 1;
DELETE FROM Tasks WHERE id = 1;
DELETE FROM Workers WHERE id = 1;
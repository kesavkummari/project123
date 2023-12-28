
# SQL statements
CREATE TABLE IF NOT EXISTS test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

INSERT INTO test_table (name, age) VALUES ('Alice', 30), ('Bob', 25);

SELECT * FROM test_table;


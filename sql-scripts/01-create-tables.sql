CREATE TABLE ucla_ccc_count (
    year INT,
    school VARCHAR(255),
    city VARCHAR(255),
    county VARCHAR(255),
    Adm FLOAT,
    App FLOAT,
    Enr FLOAT,
    PRIMARY KEY (year, school)
);

CREATE TABLE college_geocodes (
    school VARCHAR(255) PRIMARY KEY,
    lat FLOAT,
    long FLOAT
);

CREATE TABLE ucla_avg_combined (
    year INT,
    school VARCHAR(255),
    city VARCHAR(255),
    county VARCHAR(255),
    avg_admit_gpa FLOAT,
    avg_app_gpa FLOAT,
    avg_enroll_gpa FLOAT,
    PRIMARY KEY (year, school)
);

CREATE TABLE ucla_ethnicity (
    year INT,
    category VARCHAR(255),
    ethnicity VARCHAR(255),
    count FLOAT,
    percent FLOAT,
    PRIMARY KEY (year, category, ethnicity)
);

CREATE TABLE ucla_major_combined (
    year INT,
    broad_discipline VARCHAR(255),
    college_school VARCHAR(255),
    major_name VARCHAR(255),
    admit_gpa_range VARCHAR(255),
    admit_rate FLOAT,
    enroll_gpa_range VARCHAR(255),
    yield_rate FLOAT,
    admits INT,
    applicants INT,
    enrolls INT,
    enroll_25th_percentile FLOAT,
    enroll_75th_percentile FLOAT,
    admit_25th_percentile FLOAT,
    admit_75th_percentile FLOAT,
    PRIMARY KEY (year, major_name)
);

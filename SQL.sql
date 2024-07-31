/* Create Database */
CREATE DATABASE Research;
USE Research;

/* Making Tables */
CREATE TABLE Researchers (
    ResearcherID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Affiliation VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Participants (
    ParticipantID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    ConsentStatus BOOLEAN,
    Ethnicity VARCHAR(50),
    Occupation VARCHAR(100)
);

CREATE TABLE Experiments (
    ExperimentID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    DateConducted DATE,
    ResearcherID INT,
    FOREIGN KEY (ResearcherID) REFERENCES Researchers(ResearcherID)
);

CREATE TABLE Sessions (
    SessionID INT AUTO_INCREMENT PRIMARY KEY,
    ExperimentID INT,
    ParticipantID INT,
    SessionDate DATE,
    SessionTime TIME,
    SessionDuration FLOAT,
    FOREIGN KEY (ExperimentID) REFERENCES Experiments(ExperimentID),
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID)
);

CREATE TABLE BehavioralData (
    DataID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    BehaviorType VARCHAR(50),
    Measurement FLOAT,
    Timestamp DATETIME,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID)
);

CREATE TABLE SensorData (
    SensorDataID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    SensorType VARCHAR(50),
    Measurement FLOAT,
    Timestamp DATETIME,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID)
);

CREATE TABLE ExperimentalConditions (
    ConditionID INT AUTO_INCREMENT PRIMARY KEY,
    ExperimentID INT,
    ConditionName VARCHAR(100),
    ConditionDescription TEXT,
    FOREIGN KEY (ExperimentID) REFERENCES Experiments(ExperimentID)
);

CREATE TABLE Results (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    ConditionID INT,
    ResultType VARCHAR(50),
    Value FLOAT,
    Notes TEXT,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    FOREIGN KEY (ConditionID) REFERENCES ExperimentalConditions(ConditionID)
);

CREATE TABLE ResearchMaterials (
    MaterialID INT AUTO_INCREMENT PRIMARY KEY,
    ExperimentID INT,
    MaterialType VARCHAR(50),
    MaterialDescription TEXT,
    FilePath VARCHAR(255),
    FOREIGN KEY (ExperimentID) REFERENCES Experiments(ExperimentID)
);

CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    FeedbackType VARCHAR(50),
    FeedbackText TEXT,
    DateReceived DATE,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID)
);

CREATE TABLE EthicsApproval (
    ApprovalID INT AUTO_INCREMENT PRIMARY KEY,
    ExperimentID INT,
    ApprovalDate DATE,
    EthicsCommittee VARCHAR(100),
    ApprovalStatus VARCHAR(50),
    FOREIGN KEY (ExperimentID) REFERENCES Experiments(ExperimentID)
);

/* Populating Tables */

INSERT INTO Researchers (FirstName, LastName, Affiliation, Email, PhoneNumber)
VALUES 
('Dr. Alice', 'Brown', 'Gothenburg University', 'alice.brown@example.com', '555-1111'),
('Dr. Bob', 'Green', 'Stockholm University', 'bob.green@example.com', '555-2222');


INSERT INTO Participants (FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, ConsentStatus, Ethnicity, Occupation)
VALUES 
('John', 'Doe', '1985-06-15', 'Male', 'john.doe@example.com', '555-1234', TRUE, 'Caucasian', 'Software Engineer'),
('Jane', 'Smith', '1990-03-22', 'Female', 'jane.smith@example.com', '555-5678', TRUE, 'Hispanic', 'Data Scientist'),
('Emily', 'Johnson', '1982-11-30', 'Female', 'emily.johnson@example.com', '555-8765', FALSE, 'Asian', 'Teacher');

INSERT INTO Experiments (Title, Description, DateConducted, ResearcherID)
VALUES 
('Memory Test', 'A study on short-term memory retention.', '2024-01-15', 1),
('Stress Response', 'Investigating physiological responses to stress.', '2024-02-20', 2);

INSERT INTO Sessions (ExperimentID, ParticipantID, SessionDate, SessionTime, SessionDuration)
VALUES 
(1, 1, '2024-01-15', '09:00:00', 30.0),
(1, 2, '2024-01-15', '10:00:00', 45.0),
(2, 3, '2024-02-20', '14:00:00', 60.0);

INSERT INTO BehavioralData (SessionID, BehaviorType, Measurement, Timestamp)
VALUES 
(1, 'Reaction Time', 250.5, '2024-01-15 09:15:00'),
(2, 'Reaction Time', 270.3, '2024-01-15 10:30:00'),
(3, 'Stress Level', 75.0, '2024-02-20 14:30:00');

INSERT INTO SensorData (SessionID, SensorType, Measurement, Timestamp)
VALUES 
(1, 'Heart Rate Monitor', 72.0, '2024-01-15 09:05:00'),
(2, 'Heart Rate Monitor', 80.0, '2024-01-15 10:10:00'),
(3, 'Galvanic Skin Response', 1.2, '2024-02-20 14:25:00');

INSERT INTO ExperimentalConditions (ExperimentID, ConditionName, ConditionDescription)
VALUES 
(1, 'Control', 'No additional tasks or distractions.'),
(1, 'Distracted', 'Participants will perform a secondary task.'),
(2, 'Low Stress', 'Participants are exposed to minimal stressors.'),
(2, 'High Stress', 'Participants are exposed to high stressors.');

INSERT INTO Results (SessionID, ConditionID, ResultType, Value, Notes)
VALUES 
(1, 1, 'Average Reaction Time', 260.4, 'Measured in milliseconds.'),
(2, 2, 'Average Reaction Time', 275.2, 'Measured in milliseconds.'),
(3, 2, 'Stress Response Level', 80.0, 'Measured in arbitrary units.');

INSERT INTO ResearchMaterials (ExperimentID, MaterialType, MaterialDescription, FilePath)
VALUES 
(1, 'Questionnaire', 'Memory recall questionnaire.', '/materials/memory_questionnaire.pdf'),
(2, 'Stimulus', 'Stressful video clip.', '/materials/stress_video.mp4');

INSERT INTO Feedback (SessionID, FeedbackType, FeedbackText, DateReceived)
VALUES 
(1, 'Participant', 'The test was straightforward and easy to follow.', '2024-01-15'),
(2, 'Participant', 'I felt a bit rushed during the test.', '2024-01-15'),
(3, 'Researcher', 'Participant seemed highly stressed during the high stress condition.', '2024-02-20');

INSERT INTO EthicsApproval (ExperimentID, ApprovalDate, EthicsCommittee, ApprovalStatus)
VALUES 
(1, '2023-12-01', 'University Ethics Committee', 'Approved'),
(2, '2023-12-15', 'National Research Ethics Board', 'Pending');

/* Select Statement / Query */
/* Query 1: Retrieve all participants with their consent status */

SELECT ParticipantID, FirstName, LastName, ConsentStatus
FROM Participants;

/* Query 2: Get the list of experiments conducted by a specific researcher: */
SELECT ExperimentID, Title, DateConducted
FROM Experiments
WHERE ResearcherID = 1; -- Replace 1 with the actual ResearcherID

/* Query 3:   */
SELECT s.SessionID, s.SessionDate, s.SessionTime, p.FirstName, p.LastName
FROM Sessions s
JOIN Participants p ON s.ParticipantID = p.ParticipantID;

/* Query 4: Find all behavioral data entries for a specific session:   */
SELECT DataID, BehaviorType, Measurement, Timestamp
FROM BehavioralData
WHERE SessionID = 10; -- Replace 10 with the actual SessionID

/* Query 5: List all results for a particular experimental condition:   */
SELECT r.ResultID, r.ResultType, r.Value
FROM Results r
JOIN ExperimentalConditions ec ON r.ConditionID = ec.ConditionID
WHERE ec.ConditionName = 'Condition A'; -- Replace with actual condition name


/* Query 6: Show the average measurement from sensors for each session:   */
SELECT SessionID, AVG(Measurement) AS AvgMeasurement
FROM SensorData
GROUP BY SessionID;

/* Query 7: Get feedback provided by participants for a specific session:  */
SELECT FeedbackType, FeedbackText, DateReceived
FROM Feedback
WHERE SessionID = 10; -- Replace 10 with the actual SessionID

/* Function Statement / Query */
/* Query 1: Function to calculate the age of a participant based on their date of birth:  */
CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END;

/* Query 2: Function to get the total number of sessions for a given experiment: */
CREATE FUNCTION GetSessionCount(experimentID INT)
RETURNS INT
BEGIN
    DECLARE sessionCount INT;
    SELECT COUNT(*) INTO sessionCount
    FROM Sessions
    WHERE ExperimentID = experimentID;
    RETURN sessionCount;
END;

/* Query 3: Function to calculate the average behavioral measurement for a specific session:  */
CREATE FUNCTION AvgBehavioralMeasurement(sessionID INT)
RETURNS FLOAT
BEGIN
    DECLARE avgMeasurement FLOAT;
    SELECT AVG(Measurement) INTO avgMeasurement
    FROM BehavioralData
    WHERE SessionID = sessionID;
    RETURN avgMeasurement;
END;

/* Trigger Statement / Query */
/* Query 1: Trigger to automatically update a log table whenever a new session is added  */
CREATE TRIGGER LogSessionInsert
AFTER INSERT ON Sessions
FOR EACH ROW
BEGIN
    INSERT INTO SessionLog (SessionID, Action, ActionDate)
    VALUES (NEW.SessionID, 'INSERT', NOW());
END;

/* Query 2: Trigger to prevent updating a session if the session date is in the past   */
CREATE TRIGGER PreventPastDateUpdate
BEFORE UPDATE ON Sessions
FOR EACH ROW
BEGIN
    IF OLD.SessionDate < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update session with a past date';
    END IF;
END;

/* Query 3: Trigger to automatically update the participant’s consent status when a new feedback entry is added  */
CREATE TRIGGER UpdateConsentStatus
AFTER INSERT ON Feedback
FOR EACH ROW
BEGIN
    UPDATE Participants
    SET ConsentStatus = TRUE
    WHERE ParticipantID = NEW.ParticipantID;
END;

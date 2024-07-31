# Psychological Research Database System

## Overview

The Psychological Research Database System is designed to support the management and analysis of data in psychological research studies. This system stores information about participants, experiments, sessions, behavioral data, sensor data, and more.  

Note: This is a personal project, so the data included in the system is not real and is used solely for demonstration and testing purposes.
## Features

- **Participant Management**: Store and manage participant details, including consent and demographic information.
- **Experiment Management**: Track experiments, conditions, and results.
- **Session Tracking**: Record and analyze data from research sessions.
- **Behavioral and Sensor Data**: Collect and analyze behavioral and sensor data from experiments.
- **Ethics Approval Tracking**: Manage ethics approval statuses for experiments.
- **Feedback Management**: Collect and review feedback from participants and researchers.

##  SQL Concepts
- **CREATE, INSERT, UPDATE, DELETE**
- **SELECT statements (complete with SELECT, FROM, WHERE, ORDER BY, GROUP BY, HAVING)**
- **Subqueries**
- **VIEW**
- **PROCEDURE (CURSOR included)**
- **FUNCTION**
- **TRIGGER**


## Getting Started

### Prerequisites

- **Database**: MySQL
- **SQL Client**: Any SQL client tool 

### Installation

1. **Clone the Repository** (if applicable):
   ```bash
   git clone https://github.com/yourusername/psychological-research-database.git
   ```

2. **Create the Database**:
   ```sql
   CREATE DATABASE PsychologicalResearchDB;
   USE PsychologicalResearchDB;
   ```

3. **Run SQL Scripts**: Execute the provided SQL scripts to create tables, functions, triggers, and populate initial data.

### Schema Overview

The database schema includes the following tables:

- **Participants**: Stores participant information.
- **Researchers**: Stores researcher information.
- **Experiments**: Stores details about experiments.
- **Sessions**: Tracks sessions within experiments.
- **BehavioralData**: Stores data on participant behavior during sessions.
- **SensorData**: Stores sensor measurements during sessions.
- **ExperimentalConditions**: Describes conditions for each experiment.
- **Results**: Stores results from experiments.
- **ResearchMaterials**: Manages research materials used in experiments.
- **Feedback**: Collects feedback from participants and researchers.
- **EthicsApproval**: Tracks ethics approval for experiments.

### SELECT Overview

- Retrieve all participants with their consent status
- Get the list of experiments conducted by a specific researcher
- Display the session details along with participant names
- Find all behavioral data entries for a specific session
- List all results for a particular experimental condition
- Show the average measurement from sensors for each session
- Get feedback provided by participants for a specific session

### PROCEDURE Overview

- Function to calculate the age of a participant based on their date of birth
- Function to get the total number of sessions for a given experiment
- Function to calculate the average behavioral measurement for a specific session

### TRIGGERS Overview

- Trigger to automatically update a log table whenever a new session is added
- Trigger to prevent updating a session if the session date is in the past
- Trigger to automatically update the participant’s consent status when a new feedback entry is added

## Contribution

Feel free to submit pull requests or open issues for any bugs or feature requests. Contributions are welcome!

---

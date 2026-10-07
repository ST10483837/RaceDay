# RaceDay — Event Management System

## System Description

RaceDay is a full-stack web-based event management system designed for the South African road running, walking, and cycling community. The platform allows Event Organisers to create and manage events, categories, and participant results, while Participants can browse upcoming events, enter events, track their personal performance history, and prepare for race day using live weather and route information.


## User Roles

### Organiser
- Register and log in to the system
- Create, update, and delete events
- Define categories for each event (e.g., 42km Male, 21km Female, 10km Open)
- View all enrolments for their events
- Capture finish times and positions for participants after an event
- Manage venues

### Participant
- Register and log in to the system
- Browse upcoming events
- Enrol in events by selecting a category
- Withdraw from events
- View personal performance history
- View their own results

## Repository Structure


## Database Schema (7 Entities)

| Entity | Description |
|---|---|
| Organizer | Users who create and manage events |
| Venue | Locations where events are hosted |
| Event | Road running, walking, or cycling events |
| Category | Race categories within an event (distance, age group) |
| Participant | Users who enter events |
| Enrollment | Junction table linking Participants to Categories |
| Results | Finish times and positions for participants |

## Setup Instructions

### Prerequisites
- SQL Server (Express or Developer edition)
- SQL Server Management Studio (SSMS)
- Git

### Running the Database Script
1. Open SQL Server Management Studio (SSMS)
2. Connect to your SQL Server instance
3. Open `docs/database-script.sql`
4. Execute the script (F5)
5. The script will:
   - Create the `RaceDay` database
   - Create all 7 tables with primary keys, foreign keys, and constraints
   - Insert sample data (2 organisers, 2 participants, 3 events, categories, enrolments, results)

### Verifying the Database
After running the script, run the following to verify data:
```sql
USE RaceDay;
SELECT * FROM Organizer;
SELECT * FROM Venue;
SELECT * FROM Event;
SELECT * FROM Participant;
SELECT * FROM Enrollment;

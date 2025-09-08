# Hospital Regio – Medical Management System

A comprehensive medical management web application developed for the Advanced Databases course.

---

## 🎥 Video Overview

Watch this short presentation to get a quick walkthrough of the project [It's in spanish]:

[Hospital Regio Demo & Overview](https://youtu.be/idAgsmmKpPg?si=NdoinM6afUE-bDB1)


---

##  Project Description

**Hospital Regio** is a full-stack web application designed to simplify and secure healthcare operations. Built using **Flask**, **MariaDB**, and **JavaScript**, the system provides:

- Patient and doctor management (CRUD).
- Appointment scheduling and management.
- Secure access to medical history and exam results.
- Billing and treatment tracking.
- Secure online payments and data storage.

Originally deployed on a **Linux VM in Google Cloud Platform**, this application ensures real-world operational insights and scalability.

---

##  Features

### Backend & Database
- **MariaDB** database integration with normalized schema.
- Stored procedures for operations like retrieving patient history, inserting medical records, managing appointments, exams, and payments.
- Secure database connectivity via Flask.

### Web Application
- **Flask** backend with Jinja2 templates for dynamic rendering.
- **JavaScript** for frontend interactions and UI responsiveness.
- Routes for user registration, login, and session management.
- User interfaces for viewing and modifying patient history, payments, exam results, and appointments.

### Deployment & Hosting (Past)
- Deployed on a Linux VM via Google Cloud Platform.
- Configured with Gunicorn and NGINX for production-grade performance and security.

---

##  Tech Stack

- **Backend**: Python (Flask, Jinja2)  
- **Frontend**: HTML, CSS, JavaScript  
- **Database**: MariaDB with Stored Procedures  
- **Deployment**: Google Cloud Platform (Linux VM, Gunicorn, NGINX)

---

##  Getting Started

### Prerequisites
- Python 3.x
- MariaDB server
- (Optional) Linux environment or Docker

### Installation & Setup
```bash
# Clone the repo
git clone https://github.com/RicardoArath/FinalProject-AdvancedDataBases.git
cd FinalProject-AdvancedDataBases

# Install dependencies
pip install -r requirements.txt

# Configure database credentials (e.g., in config.py or environment variables)

# Initialize the database (create tables, stored procedures)
# Could use a script like: python init_db.py or run SQL manually

# Launch the application
export FLASK_APP=app.py
flask run

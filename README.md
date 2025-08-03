[![Squash TM CI/CD w/ docker](https://github.com/st2f/qa-pipeline-squash/actions/workflows/main.yml/badge.svg)](https://github.com/st2f/qa-pipeline-squash/actions/workflows/main.yml)

# Squash TM / Jira sync POC

This is a **work-in-progress project** to explore Squash TM and syncing with Jira

## Test Subject
- Sample application built with **API Platform** (Laravel API).
- Used as the system under test for requirements, test cases, and coverage graphs.

## Features / Integrations

- **Requirements synchronization** via Jira using the **Xsquash4Jira plugin**.  
  Synchronized requirements in Squash TM are automatically updated from Jira Kanban tasks.

- **Manual test management** in Squash TM.  
  Test cases can be created, linked to requirements, and tracked for coverage and execution status.

- **Test coverage visualization** in Squash TM.  
  Graphs and dashboards show which requirements are covered by manual tests.

## Screenshots
### Squash TM Coverage
<img width="1615" height="839" alt="squashtm-report" src="https://github.com/user-attachments/assets/c1537fb3-4a5e-429e-8216-0d51d65e75fa" />

### Sample API Platform Application
<img width="1241" height="827" alt="app-api-platform" src="https://github.com/user-attachments/assets/daee3845-fb78-4858-962f-8c44b76e43c1" />

### Synchronized Requirements from Jira
<img width="1484" height="896" alt="squash-jirasync-plugin" src="https://github.com/user-attachments/assets/d1edf6f7-74b4-411f-aaa0-f72dd167b2b2" />

### Jira Tasks / Squash Requirements Mapping
<img width="946" height="839" alt="jira-kanban-task" src="https://github.com/user-attachments/assets/a6198e9c-8696-4895-99cf-fe8734d52794" />

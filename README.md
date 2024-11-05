# DBProject_6941_9320
A mini database project for managing blood donations for Magen David Adom (MDA).

---

## Project Overview
This project aims to optimize the management of blood donations within MDA, focusing on:
- Tracking donors
- Managing donation stations
- Processing blood bank orders

The system provides a robust database for storing and managing information related to blood donations.
 It allows for locating suitable donors based on specific blood type requirements, retrieving detailed data for research purposes,
 and efficiently handling blood unit orders for hospitals.

**Technologies and Design Methods Used:**  
We designed the database structure using **ERD (Entity-Relationship Diagram)** and **DSD (Data Structure Diagram)**.
The implementation was done using **PL/SQL** in an **Oracle** environment.


---

## ERD Diagram
![ERD Diagram](https://github.com/moskovic20/DBProject_6941_9320/blob/main/DBProject_6941_9320/%D7%AA%D7%9E%D7%95%D7%A0%D7%95%D7%AA/ERD.png)

*Click the image to view a larger version.*


---

## Additional Information
- The project includes tables for linking entities, such as `belong_To` (associates a blood type with a donor) and `tookPlaceIn` (records where a donation occurred).
- Data normalization has been applied to BCNF and 3NF to ensure data integrity and quality.

---

## More Details
**For the full project development report from start to finish:**  
[View the complete project documentation](https://github.com/moskovic20/DBProject_6941_9320/blob/main/DBProject_6941_9320/%D7%A9%D7%9C%D7%91%20%D7%93/%D7%93%D7%95%D7%97%20%D7%94%D7%A4%D7%A8%D7%95%D7%99%D7%A7%D7%98%20%D7%A9%D7%9C%D7%91%20%D7%93.pdf)

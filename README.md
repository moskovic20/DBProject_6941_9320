# DBProject_6941_9320
A mini database project for managing blood donations for Magen David Adom (MDA).

---

## Project Overview
This project aims to optimize the management of blood donations within MDA, focusing on:
- Tracking donors
- Managing donation stations
- Processing blood bank orders

The system facilitates efficient matching of blood types, donation management, and maintains an up-to-date and reliable database.

---

## Entities
- **Blood**: Unique identifier, blood type (A, B, O, AB), and Rh factor.
- **Donor**: Details including first name, last name, gender, date of birth, weight, and phone number.
- **Station**: Donation stations with the manager's name, city, and phone number.
- **BloodBank**: Storage facilities for blood units, with manager and contact details.
- **Donation**: Information on blood donations, including the date and validity status.
- **Order**: Blood unit orders for hospitals, detailing the date, quantity, and order status.

---

## Additional Information
- The project includes tables for linking entities, such as `belong_To` (associates a blood type with a donor) and `tookPlaceIn` (records where a donation occurred).
- Data normalization has been applied to BCNF and 3NF to ensure data integrity and quality.

---

## More Details
**For the full project development report from start to finish:**  
[Link to the project documentation](https://github.com/moskovic20/DBProject_6941_9320/blob/main/DBProject_6941_9320/%D7%A9%D7%9C%D7%91%20%D7%93/%D7%93%D7%95%D7%97%20%D7%94%D7%A4%D7%A8%D7%95%D7%99%D7%A7%D7%98%20%D7%A9%D7%9C%D7%91%20%D7%93.pdf) 

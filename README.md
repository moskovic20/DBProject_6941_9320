# DBProject_6941_9320
A mini database project for managing blood donations for Magen David Adom (MDA).

# Project Overview
This project aims to optimize the management of blood donations within MDA,
focusing on tracking donors, donation stations, and blood bank orders.
The system facilitates matching blood types, managing donations efficiently,
and maintaining an up-to-date and reliable database.

# Entities
Blood: Unique identifier, blood type (A, B, O, AB), and Rh factor.
Donor: Donor details including first name, last name, gender, date of birth, and weight.
Station: Blood donation stations with manager name, city, and phone number.
BloodBank: Blood banks storing blood units, with manager and phone number details.
Donation: Information on blood donations, including date and validity status.
Order: Details of blood unit orders for hospitals, including date and quantity.

# Additional Information
*The project includes tables for linking entities, such as belong_To (associates a blood type with a donor)
 and tookPlaceIn (records where a donation occurred).
*Data normalization has been applied to BCNF and 3NF to ensure data integrity and quality.

# More Details
For the full project development report from start to finish: Link to the project documentation


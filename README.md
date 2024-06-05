Shopping Cart System

Overview
The Shopping Cart System is a Java-based application designed to simulate an online shopping environment. It utilizes a MySQL database for data storage and is intended to be run from the console. This application offers a simple yet functional approach to online shopping, including user authentication, product browsing, cart management, and payment processing.

Features
•	User Authentication: Users can register for a new account or log in with existing credentials.
•	Product Browsing: Products can be viewed by categories, providing a structured shopping experience.
•	Cart Management: Users can add items to their cart, remove items, and view their cart's current state.
•	Payment Processing: After finalizing their cart, users can proceed to payment, choosing from existing payment methods or adding new ones.
•	Logout: Users can log out of the application, which returns them to the initial login or registration screen.

How It Works
1.	Start the Application: Running the Main class presents users with options to log in, register, or exit.
2.	Authentication: The Login and Register classes handle user authentication, securely managing user sessions.
3.	Browse Products: Authenticated users can browse available products using the Product class functionalities.
4.	Manage Cart: The Cartclass allows users to add or remove products from their shopping cart.
5.	Proceed to Payment: The Payment class, implementing the PaymentGateway interface, facilitates the checkout process.
6.	Logout: Users can choose to log out, effectively ending their session.

Setup Instructions
•	Database Setup: Ensure a MySQL database is available and configured as specified in the sqldatabaseconnection.java class.
•	Compile and Run: Compile the Java classes and run the Main class to start the application.
•	Dependencies: This project requires the MySQL JDBC driver for database connectivity.

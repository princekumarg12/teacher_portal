# Teacher Portal

## Description
The Teacher Portal is a Ruby on Rails application designed for teachers to manage student records efficiently. It allows teachers to add, edit, and delete student information, as well as track their marks and subjects. The application incorporates user authentication, input validation, and follows best practices for security and maintainability.

## Ruby Version
This application is built using Ruby 3.0.0.

## System Dependencies
- Ruby 3.0.0
- Rails 6.1.7
- SQLite3 (or your preferred database)
- Node.js (for JavaScript compilation)

## Configuration
Before running the application, ensure that you have the necessary system dependencies installed. You can check your Ruby version with:

## Features
- User authentication using Devise
- Add new student entries
- Edit existing student records
- Delete student records
- Modal for adding/editing students
- Pagination of student records using Kaminari

## Technology Stack
- Ruby 3.0.0
- Rails 6.1.7
- SQLite3 for the database
- Puma as the application server
- Devise for user authentication
- RSpec for testing
- Shoulda Matchers for easier testing of Rails components
- Factory Bot for setting up test data
- Kaminari for pagination of student records

## Project Setup Instructions

Follow these steps to set up and run the Teacher Portal application locally:

1. **Clone the Repository:**
   First, clone the repository to your local machine.
   ```bash
   git clone git@github.com:princekumarg12/teacher_portal.git
   cd teacher_portal
   ```

2. **Install Dependencies:**
   Ensure you have Bundler installed. If you don’t have it, you can install it using the following command:
   ```bash
   gem install bundler
   ```
   Then, install the required gems by running:
   ```bash
   bundle install
   ```

3. **Set Up the Database:**
   Create and migrate the database using the following commands:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Seed the Database:**
   To populate your database with initial data (including any existing user records), run:
   ```bash
   rails db:seed
   ```

5. **Install JavaScript Dependencies:**
   If your project uses JavaScript packages, you will need to install them using Yarn. First, ensure you have Yarn installed. Then, run:
   ```bash
   yarn install
   ```

6. **Start the Rails Server:**
   Start your Rails server with the following command:
   ```bash
   rails server
   ```
   You can now access the application by navigating to `http://localhost:3000` in your web browser.

7. **Access the Application:**
   Once the server is running, you can access the Teacher Portal by going to the following URL in your web browser:
   ```
   http://localhost:3000
   ```

8. **User Authentication:**
   If the database is seeded with existing users, you can log in using the credentials provided in the seed file. If not, you may need to create a new user account through the registration form.
   
    **Default Seeded Credentials:**
    
        email    : teacher@example.com
        password : 123456
## Additional Notes
- Ensure that you have the necessary system dependencies installed, such as Ruby, Rails, SQLite3 (or your preferred database), and Node.js.
- If you encounter any issues, please check the logs for more information.
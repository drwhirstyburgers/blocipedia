#Blocipedia
##SaaS Wiki Collaboration Tool
##Users can create, edit and collaborate on markdown wikis.

Demo Site
Case Study
Project Objectives
Users can sign up for a free account by providing a user name, password and email
Users can sign in and out of Blocipedia
Users with a standard account, can create, read, update, and delete public wikis
User roles available: admin, standard, or premium
Development database is seeded automatically with users and wikis
Users can upgrade account from a free to a paid plan
Users can create private wikis
Users can edit wikis using Markdown syntax
Users can add and remove collaborators for private wikis
Users have readable URLs on wikis
Built With
Languages and Frameworks:
Ruby 2.3.3
Rails 5.1.2
Bootstrap
Databases:
SQLite (Test, Development)
PostgreSQL (Production)
Tools and Gems:
SendGrid for email confirmation
Devise for user authentication
Pundit for user authorization
Stripe for payment processing
Figaro for secure configuration
Redcarpet for Markdown formatting
Faker for seeding fake data
Setup and Configuration
Setup:
Environment variables were set using Figaro and are stored in config/application.yml (ignored by git).

The config/application.example.yml file illustrates how environment variables should be stored.

To run Blocipedia locally:
Clone the repository
Run bundle install
Create and migrate the database with rake db:create and rake db:migrate
Start the server using rails server
Run the app on localhost:3000

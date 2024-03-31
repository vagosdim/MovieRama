# MovieRama
Social sharing platform where users can share their favorite movies.

More detailed explanation can be found in MovieRama-Documentation.pdf

Running MovieRama
Our application was developed using Ruby on Rails version ‘7.1.3’ and Ruby version ‘3.0.0’ on Ubuntu 18.04.6 LTS. All dependencies of the application are listed in its Gemfile. Initially, the application was setup using the Postgres database, however during the end of the development process, we decided to switch to the Sqlite3 database which is supported by default by Rails in order to simplify the delivery of the current assessment. The application was running successfully with Postgres prior to switching to Sqlite3.

(PROPOSED) To further simplify the delivery and testing of the application, we also developed the Dockerfile.rails docker file. In order to run the application through the Dockerfile, we run the following commands:
    1. Open a terminal and change to ‘movie_rama’ directory which contains the web application code and the Dockerfile
    2. docker build -t movie_rama_web -f Dcokerfile.rails
    3. docker run -it -p 3000:3000 movie_rama_web
Then, by opening a browser you visit localhost:3000 and the MovieRama application should be now visible in the browser.

(NOT PROPOSED) In case you do not wish to use the provided Dockerfile, all system dependencies must be installed manually (e.g., rails, ruby, npm, etc.). After installing al necessary dependencies, you need to run the following commands to start the application:
    1. rake db:drop
    2. rails db:create 
    3. rake db:empty
    4. rails db:seed
    5. bundle exec rspec spec
    6. rails s
Notes: 
    • The ‘rake db:empty’  command executes the code of ‘empty_database.rake’ file which is is responsible for cleaning up the whole database.
    • The ‘rails db:seed’ command is responsible for populating the database with initial data for testing purposes.

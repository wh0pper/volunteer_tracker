# Volunteer Tracker
Complete for Epicodus - Ruby Week 3 Code Review

## February 23, 2018

#### Sinatra, PostgreSQL App

#### By Jared Clemmensen

## Description
  A CRUD application that tracks projects and associated volunteers for a nonprofit using a SQL database.

## Specs

#### Backend
##### Database
  1. Table for projects
  2. Table for volunteers
    * Each volunteer assigned to only one project


##### Custom ruby classes      
  3. Project
    * initialize, save to DB, update in DB, delete, read all,
  4. Volunteers
    * initialize, save to DB, update in DB, delete, assign project, read all, read all for a project,


#### Frontend
##### User stories
  1. As a non-profit employee, I want to view, add, update and delete projects.
  2. As a non-profit employee, I want to view and add volunteers.
  3. As a non-profit employee, I want to add volunteers to a project.
  4. As a non-profit employee, I want to view all volunteers on a certain project.


## Known bugs
  

## Setup/Installation Requirements
  1. install ruby 2.2.2
  2. install bundler gem ($ gem install bundler)
  3. clone or download volunteer_tracker repository
  4. run bundler in repository ($ bundle)
  5. host locally with Sinatra ($ ruby app.rb)

## Technologies Used
  This application was written in Ruby, built with Sinatra and uses Postgresql for database management.

## License
  Copyright (c) 2018 Jared Clemmensen

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

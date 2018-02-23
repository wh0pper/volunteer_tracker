#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('lib/**/*.rb')
require './lib/project'
require './lib/volunteer'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @project_list = Project.all
  erb(:home)
end

post('/') do
  new_project = Project.new({:title => params[:project_title]})
  new_project.save
  @project_list = Project.all
  erb(:home)
end

get('/project/:id') do
  project_id = params[:id]
  @project = Project.find(project_id)
  @volunteers = @project.volunteers
  erb(:project)
end

post('/project/:id') do
  project_id = params[:id]
  @project = Project.find(project_id)
  @volunteers = @project.volunteers
  erb(:project)
end

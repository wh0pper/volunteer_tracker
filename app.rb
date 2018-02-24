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
  @volunteers_list = Volunteer.all
  erb(:home)
end

post('/') do
  if params[:title]
    new_project = Project.new({:title => params[:title]})
    new_project.save
  end
  if params[:volunteer_name]
    new_volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => 0})
    new_volunteer.save
  end
  @project_list = Project.all
  @volunteers_list = Volunteer.all
  erb(:home)
end

get('/projects/:id') do
  project_id = params[:id]
  @project = Project.find(project_id)
  @volunteers = @project.volunteers
  @available_volunteers = Volunteer.all
  erb(:project)
end

post('/projects/:id') do
  project_id = params[:id]
  @project = Project.find(project_id)
  volunteer_name = params[:new_volunteer]
  volunteer_id = Volunteer.get_id(volunteer_name)
  @this_volunteer = Volunteer.find(volunteer_id)
  @this_volunteer.assign(project_id)
  @volunteers = @project.volunteers
  @available_volunteers = Volunteer.all
  erb(:project)
end

get('/projects/:id/edit') do
  project_id = params[:id]
  @project = Project.find(project_id)
  erb(:edit)
end

patch('/projects/:id/edit') do
  project_id = params[:id]
  new_title = params[:title]
  @project = Project.find(project_id)
  @project.update({:title => new_title})
  @volunteers = @project.volunteers
  @available_volunteers = Volunteer.all
  erb(:project)
end

delete('/projects/:id/edit') do
  project_id = params[:id]
  @project = Project.find(project_id)
  @project.delete
  redirect '/'
end

get('/volunteer/:id') do
  volunteer_id = params[:id]
  @volunteer = Volunteer.find(volunteer_id)
  unless @volunteer.project_id==0
    @project = Project.find(@volunteer.project_id)
  end
  erb(:volunteer)
end

patch('/volunteer/:id') do
  new_name = params[:name]
  volunteer_id = params[:id]
  @volunteer = Volunteer.find(volunteer_id)
  @volunteer.update({:name => new_name})
  erb(:volunteer)
end

delete('/volunteer/:id') do
  volunteer_id = params[:id]
  @volunteer = Volunteer.find(volunteer_id)
  @volunteer.delete
  redirect '/'
end

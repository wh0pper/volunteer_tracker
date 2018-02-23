#!/usr/bin/env ruby
require './lib/volunteer'


class Project
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def save
    DB.exec("INSERT INTO projects (title) VALUES ('#{@title}');")
    @id = DB.exec("SELECT id FROM projects WHERE title = '#{@title}';").first.fetch('id').to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM projects;")
    list = []
    results.each do |result|
      list.push(Project.new({:title => result['title'], :id => result['id'].to_i}))
    end
    return list
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    Project.new({:title => result['title'], :id => (result['id'].to_i)})
  end

  def volunteers
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    list = []
    results.each do |result|
      list.push(Volunteer.new({:name => result['name'], :project_id => result['project_id'].to_i, :id => result['id'].to_i}))
    end
    return list
  end

  def update(attributes)
    @title = attributes[:title]
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

  def == other_project
    (self.title == other_project.title) && (self.id == other_project.id)
  end
end

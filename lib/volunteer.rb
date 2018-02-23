#!/usr/bin/env ruby

class Volunteer
  attr_reader :name, :id, :project_id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @project_id = attributes[:project_id]
  end

  def save
    DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}');")
    @id = DB.exec("SELECT id FROM volunteers WHERE name = '#{@name}';")
  end

  def == other
    (self.name == other.name) && (self.id == other.id)
  end
end

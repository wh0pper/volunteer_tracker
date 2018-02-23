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
    @id = DB.exec("SELECT id FROM volunteers WHERE name = '#{@name}';").first.fetch('id').to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM volunteers;")
    list = []
    results.each do |result|
      list.push(Volunteer.new({:name => result['name'], :id => result['id'].to_i, :project_id => result['project_id']}))
    end
    return list
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM volunteers WHERE id = '#{id}';").first
    Volunteer.new({:name => result['name'], :project_id => result['project_id'].to_i, :id => result['id'].to_i})
  end

  def assign(project_id)
    
  end

  def == other
    (self.name == other.name) && (self.id == other.id)
  end
end

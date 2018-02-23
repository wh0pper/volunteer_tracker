#!/usr/bin/env ruby

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

  def == other_project
    self.title.==(other_project.title).&(self.id.==other_project.id)
  end
end

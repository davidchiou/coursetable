class ChangeForcourse < ActiveRecord::Migration
  def change
  	add_column :courses, :teacher, :string  
  	add_column :courses, :courseroom, :string  
  	add_column :courses, :grade, :string  
  end
end

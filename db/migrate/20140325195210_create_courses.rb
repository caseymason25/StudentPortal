class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :department
      t.integer :number
      t.integer :hours
      t.integer :degree_id

      t.timestamps
    end
  end
end

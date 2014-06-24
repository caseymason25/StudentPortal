class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :location
      t.boolean :approved
      t.string :host
      t.integer :user_id
      t.integer :event_type_id

      t.timestamps
    end
  end
end

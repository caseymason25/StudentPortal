class CreateSolrs < ActiveRecord::Migration
  def change
    create_table :solrs do |t|

      t.timestamps
    end
  end
end

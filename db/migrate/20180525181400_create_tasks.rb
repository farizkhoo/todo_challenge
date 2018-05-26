require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :tasks do |t|

      # add columns that you would need for this table
      t.string :idx
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
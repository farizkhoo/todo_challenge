require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class CreateTodolist < ActiveRecord::Migration[5.0]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :todolist do |t|

      # add columns that you would need for this table
      t.string :index
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
class AddColumnTasks2 < ActiveRecord::Migration[6.0]
  def change
            add_reference :tasks, :task, foreign_key: true
  end
end

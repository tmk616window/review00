class AddColumnTasks1 < ActiveRecord::Migration[6.0]
  def change
            add_column :tasks, :infra_point, :integer
  end
end

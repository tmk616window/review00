class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_user_email
      t.text :design
      t.integer :design_point
      t.text :function
      t.integer :function_point
      t.text :plan
      t.integer :plam_point
      t.text :unique
      t.integer :unique_point
      t.text :user_perspective
      t.integer :user_perspective_point
      t.string :recruit
      t.string :field
      t.integer :task_old
      t.string :task_pl
      t.string :task_tool
      t.string :github_url
      t.text :work_explain
      t.integer :study_period
      t.string :company_info
      t.text :task_coment

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.date :task_date
      t.text :content
      t.integer :duration, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end

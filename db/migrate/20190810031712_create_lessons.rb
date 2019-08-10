class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

      t.integer :department_id
      t.string :lesson_name
      t.timestamps
    end
  end
end

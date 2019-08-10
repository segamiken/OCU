class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.integer :customer_id
      t.integer :lesson_id
      t.integer :star
      t.string :professor
      t.string :attendance
      t.string :textbook
      t.string :exam
      t.string :exam_image_id
      t.text :comment
      t.timestamps
    end
  end
end

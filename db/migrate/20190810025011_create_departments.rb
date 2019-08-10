class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|

      t.integer :fuculty_id
      t.string :department_name
      t.timestamps
    end
  end
end

class CreateFuculties < ActiveRecord::Migration[5.2]
  def change
    create_table :fuculties do |t|

      t.string :fuculty_name
      t.timestamps
    end
  end
end

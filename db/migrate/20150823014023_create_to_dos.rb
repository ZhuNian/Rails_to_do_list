class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.string :text
      t.boolean :statue

      t.timestamps null: false
    end
  end
end

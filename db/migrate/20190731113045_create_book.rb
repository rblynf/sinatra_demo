class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :descript
      t.string :remark

      t.timestamps
    end
  end
end
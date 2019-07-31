class CreateAppLog < ActiveRecord::Migration[5.2]
  def change
    create_table :app_logs do |t|
      t.string :ex_klass
      t.text :ex_msg
      t.string :ex_location
      t.text :ex_context
      t.string :ex_type   # warn or error

      t.timestamps
    end
  end
end
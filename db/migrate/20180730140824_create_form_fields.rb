class CreateFormFields < ActiveRecord::Migration[5.2]
  def change
    create_table :form_fields do |t|
      t.integer :form_id
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end

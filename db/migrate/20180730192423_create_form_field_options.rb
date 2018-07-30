class CreateFormFieldOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :form_field_options do |t|
      t.string :name
      t.string :value
      t.integer :form_field_id

      t.timestamps
    end
  end
end

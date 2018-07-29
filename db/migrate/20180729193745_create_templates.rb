class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :name
      t.text :template_code
      t.string :type

      t.timestamps
    end
  end
end

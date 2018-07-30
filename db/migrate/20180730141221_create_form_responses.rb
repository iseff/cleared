class CreateFormResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :form_responses do |t|
      t.integer :form_field_id
      t.string :responder_id
      t.string :value

      t.timestamps
    end
  end
end

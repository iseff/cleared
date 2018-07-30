class Form < ApplicationRecord
  has_many :fields, class_name: "FormField"
end

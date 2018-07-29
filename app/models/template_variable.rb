class TemplateVariable < ApplicationRecord
  has_many :variable_values, class_name: "PageTemplateVariableValue"
end

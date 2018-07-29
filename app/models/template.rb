class Template < ApplicationRecord
  has_many :variables, class_name: 'TemplateVariable'
end

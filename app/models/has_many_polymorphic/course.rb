class Course < ActiveRecord::Base
  has_many :teaching_assistants, as: :teachable

  accepts_nested_attributes_for :teaching_assistants
end

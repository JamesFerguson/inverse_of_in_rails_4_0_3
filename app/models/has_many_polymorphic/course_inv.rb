class CourseInv < ActiveRecord::Base
  has_many :teaching_assistant_invs, as: :teachable_inv, inverse_of: :teachable_inv

  accepts_nested_attributes_for :teaching_assistant_invs
end

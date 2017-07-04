class TeachingAssistantInv < ActiveRecord::Base
  belongs_to :teachable_inv, polymorphic: true # , inverse_of: :teaching_assistant_invs # inverse_of here does nothing

  validates :teachable_inv, presence: true
end

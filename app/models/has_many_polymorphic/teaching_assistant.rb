class TeachingAssistant < ActiveRecord::Base
  belongs_to :teachable, polymorphic: true

  validates :teachable, presence: true
end

class TeachingAssistant < ActiveRecord::Base
  belongs_to :teachable, polymorphic: true
end

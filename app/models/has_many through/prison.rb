class Prison < ActiveRecord::Base
  has_many :sentences
  has_many :criminals, through: :sentences
end

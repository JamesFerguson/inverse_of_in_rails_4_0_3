class Criminal < ActiveRecord::Base
  has_many :sentences
  has_many :prisons, through: :sentences
end

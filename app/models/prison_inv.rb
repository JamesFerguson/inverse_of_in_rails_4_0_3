class PrisonInv < ActiveRecord::Base
  has_many :sentences, inverse_of: :prison
  has_many :criminals, through: :sentences #, inverse_of: :prisons
end

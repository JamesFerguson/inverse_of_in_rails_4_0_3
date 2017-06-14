class CriminalInv < ActiveRecord::Base
  has_many :sentences, inverse_of: :criminal
  has_many :prisons, through: :sentences #, inverse_of: :criminals
end

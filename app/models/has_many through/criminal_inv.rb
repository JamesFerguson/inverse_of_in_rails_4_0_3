class CriminalInv < ActiveRecord::Base
  has_many :sentence_invs, inverse_of: :criminal_inv
  has_many :prison_invs, through: :sentence_invs #, inverse_of: :criminal_invs
end

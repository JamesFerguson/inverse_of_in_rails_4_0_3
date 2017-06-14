class PrisonInv < ActiveRecord::Base
  has_many :sentence_invs, inverse_of: :prison_inv
  has_many :criminal_invs, through: :sentence_invs #, inverse_of: :prisons
end

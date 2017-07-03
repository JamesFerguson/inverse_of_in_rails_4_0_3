class SentenceInv < ActiveRecord::Base
  belongs_to :criminal_inv, inverse_of: :sentence_invs
  belongs_to :prison_inv, inverse_of: :sentence_invs
end

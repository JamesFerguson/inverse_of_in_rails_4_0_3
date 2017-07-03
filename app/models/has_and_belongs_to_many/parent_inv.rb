class ParentInv < ActiveRecord::Base
  has_and_belongs_to_many :child_invs #, inverse_of: :parent_invs # causes 'ArgumentError: Unknown key: inverse_of'
end

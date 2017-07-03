class ChildInv < ActiveRecord::Base
  has_and_belongs_to_many :parent_invs #, inverse_of: :child_invs # causes 'ArgumentError: Unknown key: inverse_of'
end

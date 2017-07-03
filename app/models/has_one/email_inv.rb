class EmailInv < ActiveRecord::Base
  belongs_to :user_inv, inverse_of: :email_inv
end

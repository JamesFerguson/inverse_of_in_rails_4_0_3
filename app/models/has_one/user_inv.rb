class UserInv < ActiveRecord::Base
  has_one :email_inv, inverse_of: :user_inv
end

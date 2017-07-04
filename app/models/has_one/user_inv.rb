class UserInv < ActiveRecord::Base
  has_one :email_inv, inverse_of: :user_inv

  accepts_nested_attributes_for :email_inv
end

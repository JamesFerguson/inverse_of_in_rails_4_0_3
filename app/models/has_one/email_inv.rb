class EmailInv < ActiveRecord::Base
  belongs_to :user_inv, inverse_of: :email_inv

  validates :user_inv, presence: true
end

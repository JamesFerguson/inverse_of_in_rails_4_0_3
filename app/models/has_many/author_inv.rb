class AuthorInv < ActiveRecord::Base
  has_many :article_invs, inverse_of: :author_inv

  accepts_nested_attributes_for :article_invs
end

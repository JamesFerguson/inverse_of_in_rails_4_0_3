class AuthorInv < ActiveRecord::Base
  has_many :article_invs, inverse_of: :author_inv
end

class ArticleInv < ActiveRecord::Base
  belongs_to :author_inv, inverse_of: :article_invs # inverse_of here does nothing

  validates :author_inv, presence: true
end

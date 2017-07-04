require 'test_helper'

# describe "inverse_of on simple has_many/belongs_to relations"
class HasManyTest < ActiveSupport::TestCase
  # reuses object from has_many side
  test "without inverse_of on has_many articles.author triggers a db hit" do
    author = Author.create(name: 'Rita Skeeter')
    article = author.articles.create(name: 'A History of Quidditch')

    assert_not_equal article.author.object_id, author.object_id
  end

  test "with inverse_of on has_many articles.author no db hit and object_ids are equal/one instance" do
    iauthor = AuthorInv.create(name: 'Rita Skeeter')
    iarticle = iauthor.article_invs.create(name: 'A History of Quidditch')

    assert_equal iarticle.author_inv.object_id, iauthor.object_id
  end

  # doesn't reuse object from belongs_to side
  test "without inverse_of on belongs_to author.articles triggers a db hit" do
    article = Article.create(name: 'A History of Quidditch')
    author = article.build_author(name: 'Rita Skeeter')
    author.save!

    assert_not_equal author.articles.first.object_id, article.object_id
  end

  test "with inverse_of on belongs_to, author.articles still triggers db hit - has no benefit" do
    iarticle = ArticleInv.create(name: 'A History of Quidditch')
    iauthor = iarticle.build_author_inv(name: 'Rita Skeeter')
    iauthor.save!

    assert_not_equal iauthor.article_invs.first.object_id, iarticle.object_id
  end

  # describe accepts_nested_attributes_for behaviour - fails validation without inverse_of
  test "without inverse_of on author.articles, creating nested model fails due to validation error" do
    params = { name: 'Rita Skeeter', articles_attributes: [{ name: 'A History of Quidditch' }] }

    assert_raises ActiveRecord::RecordInvalid do
      Author.create!(params)
    end
  end

  test "with inverse_of on author_inv.article_invs, creating nested model succeeds and passes validation" do
    params = { name: 'Rita Skeeter', article_invs_attributes: [{ name: 'A History of Quidditch' }] }

    assert_nothing_raised do
      AuthorInv.create!(params)
    end
  end
end

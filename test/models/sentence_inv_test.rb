require 'test_helper'

class SentenceInvTest < ActiveSupport::TestCase
  # describe "inverse_of on simple has_one/belongs_to relations"
  #
  test "without inverse_of on has_one user.email triggers a db hit" do
    user = User.create(name: 'Harry')
    email = user.email = Email.create(name: 'harry@hogwarts.edu.uk')

    assert_not_equal email.user.object_id, user.object_id
  end

  test "with inverse_of on has_one user.email no db hit and object_ids are equal/one instance" do
    iuser = UserInv.create(name: 'Harry')
    iemail = iuser.email_inv = EmailInv.create(name: 'harry@hogwarts.edu.uk')

    assert_equal iemail.user_inv.object_id, iuser.object_id
  end

  # describe "inverse_of on simple has_many/belongs_to relations"
  #
  test "without inverse_of on has_many articles.author triggers a db hit" do
    author = Author.create(name: 'Harry')
    article = author.articles.create(name: 'A History of Quidditch')

    assert_not_equal article.author.object_id, author.object_id
  end

  test "with inverse_of on has_many articles.author no db hit and object_ids are equal/one instance" do
    iauthor = AuthorInv.create(name: 'Harry')
    iarticle = iauthor.article_invs.create(name: 'A History of Quidditch')

    assert_equal iarticle.author_inv.object_id, iauthor.object_id
  end

  # describe "inverse of on belongs_to in join models ensures the join instance is saved
  #  if we build and save the subject of a has_many :through."
  #
  test "without inverse_of the criminal's sentence join record is never saved and the link to the prison doeesn't exist" do
    prison = Prison.create(name: 'Alcatraz')
    criminal = prison.criminals.build(name: 'Al Capone')
    criminal.save

    assert_not_equal criminal.prisons.first, prison
    assert_not_equal criminal.sentences.size, 1
  end

  test "with inverse_of the join record is saved too and the criminal's prison can be found" do
    iprison = PrisonInv.create(name: 'Alcatraz')
    icriminal = iprison.criminal_invs.build(name: 'Al Capone')
    icriminal.save

    assert_equal icriminal.prison_invs.first, iprison
    assert_equal icriminal.sentence_invs.size, 1
  end

  test "when using create instead of build, both declarations result in a correctly saved join record" do
    prison = Prison.create(name: 'Alcatraz')
    criminal = prison.criminals.create(name: 'Al Capone')

    assert_equal criminal.prisons.first, prison
    assert_equal criminal.sentences.size, 1
  end
end

require 'test_helper'

class SentenceInvTest < ActiveSupport::TestCase
  # describe "inverse of on belongs_to in join models ensures the join instance is saved 
  #  if we build and save the subject of a has_many :through.
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
end

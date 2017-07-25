require 'test_helper'

# describe "inverse_of on belongs_to in join models ensures the join record is saved
#  if we build and save the subject of a has_many :through."
class HasManyThroughTest < ActiveSupport::TestCase
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

  # inverse_of on has_many to join table still save db hit
  test "without inverse_of on has_many sentences.prison triggers a db hit" do
    prison = Prison.create(name: 'Azkaban')
    sentence = prison.sentences.create(length: 25)

    assert_not_equal sentence.prison.object_id, prison.object_id
  end

  test "with inverse_of on has_many sentences.prison no db hit and object_ids are equal/one instance" do
    iprison = PrisonInv.create(name: 'Azkaban')
    isentence = iprison.sentence_invs.create(length: 25)

    assert_equal isentence.prison_inv.object_id, iprison.object_id
  end

  test "without inverse_of on has_many sentences.criminal triggers a db hit" do
    criminal = Criminal.create(name: 'Sirius Black')
    sentence = criminal.sentences.create(length: 25)

    assert_not_equal sentence.criminal.object_id, criminal.object_id
  end

  test "with inverse_of on has_many sentences.criminal no db hit and object_ids are equal/one instance" do
    icriminal = CriminalInv.create(name: 'Sirius Black')
    isentence = icriminal.sentence_invs.create(length: 25)

    assert_equal isentence.criminal_inv.object_id, icriminal.object_id
  end
end

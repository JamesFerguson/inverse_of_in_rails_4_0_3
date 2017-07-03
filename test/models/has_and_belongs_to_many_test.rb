require 'test_helper'

# describe inverse_of on habtm relations - specifically, inverse_of is not permitted and causes ArgumentError
class SentenceInvTest < ActiveSupport::TestCase
  test "with inverse_of on parent_inv's habtm to child_inv compile fails with 'ArgumentError: Unknown key: inverse_of'" do
    skip "inverse_of on habtm isn't supported"

    iparent = ParentInv.create(name: 'Lily')
    ichild = iparent.child_invs.build(name: 'Harry')
    ichild.save!

    assert_not_equal ichild.parent_invs.first.object_id, iparent.object_id
  end
end

require 'test_helper'

class HasOneTest < ActiveSupport::TestCase
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

  test "without inverse_of on email belongs_to user triggers a db hit" do
    email = Email.create(name: 'harry@hogwarts.edu.uk')
    user = email.user = User.create(name: 'Harry')

    assert_not_equal user.email.object_id, email.object_id
  end

  test "with inverse_of on email belongs_to user no db hit and object_ids are equal/one instance" do
    iemail = EmailInv.create(name: 'harry@hogwarts.edu.uk')
    iuser = iemail.user_inv = UserInv.create(name: 'Harry')

    assert_equal iuser.email_inv.object_id, iemail.object_id
  end

  # describe accepts_nested_attributes_for behaviour - fails validation without inverse_of
  test "without inverse_of on user.emails, creating nested model fails due to validation error" do
    params = { name: 'Rita Skeeter', email_attributes: { name: 'rita@dailyprophet.wiz.uk' } }

    assert_raises ActiveRecord::RecordInvalid do
      User.create!(params)
    end
  end

  test "with inverse_of on user_inv.email_inv, creating nested model succeeds and passes validation" do
    params = { name: 'Rita Skeeter', email_inv_attributes: { name: 'rita@dailyprophet.wiz.uk' } }

    assert_nothing_raised do
      UserInv.create!(params)
    end
  end
end

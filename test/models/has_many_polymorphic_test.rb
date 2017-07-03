require 'test_helper'

# describe inverse_of on 'has_many...polymorphic: true' relations
class HasManyPolymorphicTest < ActiveSupport::TestCase
  # describe "inverse_of on simple has_one/belongs_to relations"
  #
  #test "without inverse_of on has_one user.email triggers a db hit" do
    #user = User.create(name: 'Harry')
    #email = user.email = Email.create(name: 'harry@hogwarts.edu.uk')

    #assert_not_equal email.user.object_id, user.object_id
  #end

  #test "with inverse_of on has_one user.email no db hit and object_ids are equal/one instance" do
    #iuser = UserInv.create(name: 'Harry')
    #iemail = iuser.email_inv = EmailInv.create(name: 'harry@hogwarts.edu.uk')

    #assert_equal iemail.user_inv.object_id, iuser.object_id
  #end


end

require 'test_helper'

# describe inverse_of on 'has_many...polymorphic: true' relations
class HasManyPolymorphicTest < ActiveSupport::TestCase
  test "without inverse_of on has_many (opposite polymorphic belongs_to) (course -> ta) still triggers a db hit" do
    course = Course.create(name: 'Exploding Code and How to make it go Boom')
    course.teaching_assistants << (teaching_assistant = TeachingAssistant.create(name: 'Gavrilo Princip'))

    assert_not_equal teaching_assistant.teachable.object_id, course.object_id
  end

  test "with inverse_of on has_many (opposite polymorphic belongs_to) (icourse -> ita) no db hit" do
    icourse = CourseInv.create(name: 'Exploding Code and How to make it go Boom')
    icourse.teaching_assistant_invs << (iteaching_assistant = TeachingAssistantInv.create(name: 'Gavrilo Princip'))

    assert_equal iteaching_assistant.teachable_inv.object_id, icourse.object_id
  end

  test "without inverse_of on both sides of 'has_many polymorphic: true' (ta -> course) still triggers a db hit" do
    iteaching_assistant = TeachingAssistant.create(name: 'Gavrilo Princip')
    icourse = iteaching_assistant.teachable = Course.create(name: 'Exploding Code and How to make it go Boom')

    assert_not_equal icourse.teaching_assistants.first.object_id, iteaching_assistant.object_id
  end

  test "with inverse_of on 'belongs_to polymorphic: true' (ita -> icourse) still triggers a db hit" do
    iteaching_assistant = TeachingAssistantInv.create(name: 'Gavrilo Princip')
    icourse = iteaching_assistant.teachable_inv = CourseInv.create(name: 'Exploding Code and How to make it go Boom')

    assert_not_equal icourse.teaching_assistant_invs.first.object_id, iteaching_assistant.object_id
  end

  # describe accepts_nested_attributes_for behaviour - fails validation without inverse_of
  test "without inverse_of on course.teaching_assistants, creating nested model fails due to validation error" do
    params = { name: 'Defense Against the Dark Arts', teaching_assistants_attributes: [{ name: 'Mad Eye Moody' }] }

    assert_raises ActiveRecord::RecordInvalid do
      Course.create!(params)
    end
  end

  test "with inverse_of on course_inv.teaching_assistant_invs, creating nested model succeeds and passes validation" do
    params = { name: 'Defense Against the Dark Arts', teaching_assistant_invs_attributes: [{ name: 'Mad Eye Moody' }] }

    assert_nothing_raised do
      CourseInv.create!(params)
    end
  end
end

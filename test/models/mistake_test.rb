require 'test_helper'

class MistakeTest < ActiveSupport::TestCase
  test "should add new tags" do
    mistake = mistakes(:two)

    assert_difference ->{ Tag.count } => 1 do
      mistake.set_tags "hello"
    end
  end

  test "should change tags" do
    mistake = mistakes(:two)
    tag = Tag.create(name: "woot", user_id: mistake.user_id)
    mistake.tags << tag

    assert_difference ->{ mistake.tags.count } => 0, ->{ Tag.count } => 1 do
      mistake.set_tags "hello"
    end

    assert_not_includes mistake.tags, tag
  end

  test "should keep tags that exist" do
    mistake = mistakes(:two)
    tag = Tag.create(name: "woot", user_id: mistake.user_id)
    mistake.tags << tag

    assert_difference ->{ mistake.tags.count } => 0, ->{ Tag.count } => 0 do
      mistake.set_tags tag.name
    end
  end
end

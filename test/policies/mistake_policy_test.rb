require 'test_helper'

class MistakePolicyTest < PolicyTest
  setup do
    @user1 = users(:one)
    @user2 = users(:two)
    @mistake = mistakes(:one)
  end

  test "Should be able to see the index" do
    assert forbid(nil, Mistake, :index)
    assert permit(@user1, Mistake, :index)
  end

  test "Should be able to see a mistake owned by the current user and not others" do
    assert forbid(nil, @mistake, :show)
    assert permit(@user1, @mistake, :show)
    assert forbid(@user2, @mistake, :show)
  end

  test "Should be able to create a new mistake" do
    assert forbid(nil, Mistake, :new)
    assert permit(@user1, Mistake, :new)
  end

  test "Should be able to update a mistake" do
    assert forbid(nil, @mistake, :update)
    assert permit(@user1, @mistake, :update)
    assert forbid(@user2, @mistake, :update)
  end

  test "Should be able to destroy a mistake" do
    assert forbid(nil, @mistake, :destroy)
    assert permit(@user1, @mistake, :destroy)
    assert forbid(@user2, @mistake, :destroy)
  end
end

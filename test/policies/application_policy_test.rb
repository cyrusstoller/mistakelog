require 'test_helper'

class ApplicationPolicyTest < PolicyTest

  def test_new
    assert_not permit(User.first, {}, :new)
  end

  def test_create
    assert forbid(User.first, {}, :create)
  end

end

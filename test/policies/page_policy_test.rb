require 'test_helper'

class PagePolicyTest < PolicyTest
  def test_home
    assert permit(nil, :page, :home)
  end

  def test_about
    assert permit(nil, :page, :about)
  end
end

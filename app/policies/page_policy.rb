class PagePolicy < Struct.new(:user, :page)
  def home?
    true
  end

  def about?
    true
  end
end

class PagesController < ApplicationController
  before_action ->{ authorize :page }

  def home
    @title = "Home"
  end

  def about
    @title = "About"
    @github = "https://github.com/cyrusstoller/mistakelog"
  end
end

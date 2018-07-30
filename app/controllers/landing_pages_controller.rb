class LandingPagesController < ApplicationController
  def show
    render_page(type: LandingPage)
  end
end

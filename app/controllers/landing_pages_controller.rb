class LandingPagesController < ApplicationController
  def show
    render_page(type: LandingPage)
  end

  def privacy_policy
    render_page(type: PrivacyPolicyPage)
  end

end

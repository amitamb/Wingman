class HomeController < ApplicationController
  def index
    if current_user
      if current_user.is_setup
        render "dashboard"
      else
        redirect_to setup_url
      end
    end
  end
  
  def setup
    # setup user for skills and interests
  end
end

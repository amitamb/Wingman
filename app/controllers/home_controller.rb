class HomeController < ApplicationController
  def index
    if current_user
      if current_user.person.present?
        render "dashboard"
      else
        redirect_to '/people/0/edit'
      end
    end
  end
  
  def wingmen
    
  end
  
  def helping
    
  end
  
  def popup
    @url = params[:url]
    render :layout => nil
  end
end

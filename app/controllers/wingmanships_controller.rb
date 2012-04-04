class WingmanshipsController < ApplicationController
  def create
    if params[:wingman_id] == current_person.id
      redirect_to :back, :alert => "Can't send wingman request to yourself."
    else
      @wingmanship = current_person.sent_wingmanship_requests.where(:wingman_id => params[:wingman_id]).first
      if !@wingmanship
        @wingmanship = current_person.sent_wingmanship_requests.create(:wingman_id => params[:wingman_id])
        redirect_to :back, :notice => "Wingmanship Request sent successfully."
      else
        redirect_to :back, :alert => "Do not send request again."
      end
    end
  end

  def destroy
    @wingmanship = current_person.all_wingmanships.find(params[:id])
    @wingmanship.destroy
    flash[:notice] = "Removed wingmanship #{ @wingmanship.approved? ? "" : "request " }successfully."
    redirect_to :back
  end

  def accept
    @wingmanship = current_person.received_wingmanship_requests.find(params[:id])
    @wingmanship.approve!
    flash[:notice] = "Now you are a wingman for " + @wingmanship.person.name + "."
    redirect_to :back
  end
end

class StaticPagesController < ApplicationController
  def home
    if current_user
      @aroundshop = Shop.near([current_user.latitude, current_user.longitude], 30, :units => :km)
    end
    @bid = Bid.new
  end

  def help
  end

  def about
  end

  def contact
    @message = Message.new
  end

  def sendquestion
   @message = Message.new(message_params)
   ContactMailer.contact_email(@message).deliver_now
    respond_to do |format|
       format.html { render :contact, notice: 'Message Envoyé' }
       format.json { render json: static_pages_contact_path, status: :created, location: static_pages_contact_path }
    end
  end




private

  def message_params
    params.require(:message).permit(:prenom, :objet, :email, :contenu) # permit keys
  end


end

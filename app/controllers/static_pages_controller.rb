class StaticPagesController < ApplicationController
  def home
    @client = request.location

    if current_user
      @aroundshop = Shop.near([current_user.latitude, current_user.longitude], 30, :units => :km)
    else
      @aroundshop = Shop.near([@client.latitude, @client.longitude], 30, :units => :km)
    end

    @aroundlastbids= []
    @shopidlist = @aroundshop.map{ |x| x.id }
    @shopidlist.count.times do |item|
       Bid.where(shop_id:"#{@shopidlist[item]}").order(:go_at).reverse.each do |i|
         if i.go_at >= Date.today
         @aroundlastbids << i
       end
       end
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
 def set_ip
   if current_user
     @aroundshop = Shop.near([current_user.latitude, current_user.longitude], 30, :units => :km)
   end
   @client = request.location
 end

end

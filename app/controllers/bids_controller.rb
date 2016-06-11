class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy, :reserver, :annulerresa]
  before_filter :authenticate_user!, only: [:index, :show, :new, :create, :destroy]
  before_filter :is_admin, only: [:index, :show, :new, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all
  end

  def search
    @client = request.location
    @search= params[:search].capitalize
    @searchlist = Shop.where("name LIKE ?","%#{@search}%")
    @shopidlist = @searchlist.map{ |x| x.id }
    @bids=[]
    @shopidlist.count.times do |item|
       Bid.where(shop_id:"#{@shopidlist[item]}").order(:created_at).reverse.each do |i|
         @bids << i
    end
    end


  end

  def reserver

    @coinsdispo = Coin.where("(user_id = #{current_user.id} AND bid_id = 0)")
    if @coinsdispo.size > 0
      if @bid.pass1_id == 0
          @bid.pass1_id = current_user.id
        elsif @bid.pass2_id == 0
          @bid.pass2_id = current_user.id
        elsif @bid.pass3_id == 0
          @bid.pass3_id = current_user.id
        else
          @bid.pass4_id = current_user.id
      end
       ContactMailer.reservation_email(current_user, @bid).deliver_now
       ContactMailer.reservationP_email(current_user,@bid).deliver_now
       @coinsdispo.first.update_attributes(:bid_id => @bid.id, :comment2 => "reservation pour le trajet #{@bid.id} le #{DateTime.now.to_s}")
      respond_to do |format|
        if @bid.save
          format.html { redirect_to root_path, notice: 'Votre reservation a été enregistrée' }
          format.json { render :show, status: :created, location: @bid }
        else
          format.html { render :new }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @bid.save
          format.html { redirect_to root_path, notice: "Vous n'avez pas assez de cocoins " }
          format.json { render :show, status: :created, location: @bid }
        else
          format.html { render :new }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # GET /bids/1
  # GET /bids/1.json
  def annulerresa
    @coinused = Coin.where("(user_id = #{current_user.id} AND bid_id = #{@bid.id})")
    if @coinused.size > 0
      if @bid.pass1_id == current_user.id
        @bid.pass1_id = 0
      elsif @bid.pass2_id == current_user.id
        @bid.pass2_id = 0
      elsif @bid.pass3_id == current_user.id
        @bid.pass3_id = 0
      else
        @bid.pass4_id = 0
      end
      ContactMailer.annulresa_email(current_user,@bid).deliver_now
      ContactMailer.annulresaP_email(current_user,@bid).deliver_now
      @coinused.first.update_attributes(:bid_id => 0, :comment2 => "annulation pour le trajet #{@bid.id} le #{DateTime.now.to_s}")
      respond_to do |format|
        if @bid.save
          format.html { redirect_to root_path, notice: 'Votre reservation a été annulée' }
          format.json { render :show, status: :created, location: @bid }
        else
          format.html { render :new }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @bid.save
          format.html { redirect_to root_path, notice: "Vous n'avez pas de reservation pour ce trajet " }
          format.json { render :show, status: :created, location: @bid }
        else
          format.html { render :new }
          format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(bid_params)
    @bid.driver_id = current_user.id
    if @bid.nbrplace == 1
      @bid.pass1_id = 0
    elsif @bid.nbrplace == 2
      @bid.pass1_id = 0
      @bid.pass2_id = 0
    elsif @bid.nbrplace == 3
      @bid.pass1_id = 0
      @bid.pass2_id = 0
      @bid.pass3_id = 0
    else
      @bid.pass1_id = 0
      @bid.pass2_id = 0
      @bid.pass3_id = 0
      @bid.pass4_id = 0
    end

    if @bid.withreturn ==false
        respond_to do |format|
          if @bid.save
            format.html { redirect_to @bid, notice: 'Annonce enregistrée.' }
            format.json { render :show, status: :created, location: @bid }
          else
            format.html { render :new }
            format.json { render json: @bid.errors, status: :unprocessable_entity }
          end
        end
    else
        @return = Bid.new(bid_params)
        @return.driver_id=current_user.id
        if @return.nbrplace == 1
          @return.pass1_id = 0
        elsif @return.nbrplace == 2
          @return.pass1_id = 0
          @return.pass2_id = 0
        elsif @return.nbrplace == 3
          @return.pass1_id = 0
          @return.pass2_id = 0
          @return.pass3_id = 0
        else
          @return.pass1_id = 0
          @return.pass2_id = 0
          @return.pass3_id = 0
          @return.pass4_id = 0
        end
        @return.isreturn=true
        @return.save
        @bid.save
        respond_to do |format|
          if @bid.save
            format.html { redirect_to @bid, notice: 'Aller-retour créé.' }
            format.json { render :show, status: :created, location: @bid }
          else
            format.html { render :new }
            format.json { render json: @bid.errors, status: :unprocessable_entity }
          end
        end
    end
  end


  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end
    def is_admin
      if current_user.admin
        true
      else
        respond_to do |format|
            format.html { redirect_to root_path, notice: "Votre n'avez pas les droits d'acces"  }
            format.json { render json: @bid.errors, status: :unprocessable_entity }
        end
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:shop_id, :driver_id, :go_at, :come_back, :pass1_id, :pass2_id, :pass3_id, :pass4_id, :cangodrive, :nbrplace, :withreturn)
    end
end

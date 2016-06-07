class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  marker.lat user.latitude
  marker.lng user.longitude
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @coin1 = Coin.create(user_id:@user.id, comment1:"Welcome cocoin 1")
    @coin1.save
    @coin2 = Coin.create(user_id:@user.id, comment1:"Welcome cocoin 2")
    @coin2.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Vous avez été inscrit, vous avez gagné 2 cocoins pour essayer le covoiturage shopping! ' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Votre profil a été modifié.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :username, :admin, :nom, :prenom, :comment, :subscribe, :city, :latitude, :longitude, :adress, :zipcode, :gender, :driver, :cbrand_id, :cmodel_id, :carsize, :email, :phone, :xp, :fulladress, :avatar, :avatar_cache)
    end

end

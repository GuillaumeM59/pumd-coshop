class TrajetpumdsController < ApplicationController
  before_action :set_trajetpumd, only: [:show, :edit, :update, :destroy]

  # GET /trajetpumds
  # GET /trajetpumds.json
  def index
    @trajetpumds = Trajetpumd.all
  end

  # GET /trajetpumds/1
  # GET /trajetpumds/1.json
  def show
  end

  # GET /trajetpumds/new
  def new
    @trajetpumd = Trajetpumd.new
  end

  # GET /trajetpumds/1/edit
  def edit
  end

  # POST /trajetpumds
  # POST /trajetpumds.json
  def create
    @trajetpumd = Trajetpumd.new(trajetpumd_params)

    respond_to do |format|
      if @trajetpumd.save
        format.html { redirect_to @trajetpumd, notice: 'Trajetpumd was successfully created.' }
        format.json { render :show, status: :created, location: @trajetpumd }
      else
        format.html { render :new }
        format.json { render json: @trajetpumd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trajetpumds/1
  # PATCH/PUT /trajetpumds/1.json
  def update
    respond_to do |format|
      if @trajetpumd.update(trajetpumd_params)
        format.html { redirect_to @trajetpumd, notice: 'Trajetpumd was successfully updated.' }
        format.json { render :show, status: :ok, location: @trajetpumd }
      else
        format.html { render :edit }
        format.json { render json: @trajetpumd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trajetpumds/1
  # DELETE /trajetpumds/1.json
  def destroy
    @trajetpumd.destroy
    respond_to do |format|
      format.html { redirect_to trajetpumds_url, notice: 'Trajetpumd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trajetpumd
      @trajetpumd = Trajetpumd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trajetpumd_params
      params.require(:trajetpumd).permit(:driver_id, :shop_id, :td_date, :td_time, :regulier, :drive1_ref, :drive2_ref, :drive3_ref, :drive4_ref, :drive5_ref, :drive6_ref, :drive1_size, :drive2_size, :drive3_size, :drive4_size, :drive5_size, :drive6_size)
    end
end

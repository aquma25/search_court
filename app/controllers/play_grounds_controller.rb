class PlayGroundsController < ApplicationController
  before_action :set_play_ground, only: [:show, :edit, :update, :destroy]

  # GET /play_grounds
  # GET /play_grounds.json
  def index
    @play_grounds = PlayGround.all
  end

  # GET /play_grounds/1
  # GET /play_grounds/1.json
  def show
  end

  # GET /play_grounds/new
  def new
    @play_ground = PlayGround.new
  end

  # GET /play_grounds/1/edit
  def edit
  end

  # POST /play_grounds
  # POST /play_grounds.json
  def create
    @play_ground = PlayGround.new(play_ground_params)

    respond_to do |format|
      if @play_ground.save
        format.html { redirect_to @play_ground, notice: 'Play ground was successfully created.' }
        format.json { render :show, status: :created, location: @play_ground }
      else
        format.html { render :new }
        format.json { render json: @play_ground.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /play_grounds/1
  # PATCH/PUT /play_grounds/1.json
  def update
    respond_to do |format|
      if @play_ground.update(play_ground_params)
        format.html { redirect_to @play_ground, notice: 'Play ground was successfully updated.' }
        format.json { render :show, status: :ok, location: @play_ground }
      else
        format.html { render :edit }
        format.json { render json: @play_ground.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /play_grounds/1
  # DELETE /play_grounds/1.json
  def destroy
    @play_ground.destroy
    respond_to do |format|
      format.html { redirect_to play_grounds_url, notice: 'Play ground was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_ground
      @play_ground = PlayGround.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_ground_params
      params.require(:play_ground).permit(:address, :latitude, :longitude, :court_name, :content, :place, :status, :release, :user_id)
    end
end

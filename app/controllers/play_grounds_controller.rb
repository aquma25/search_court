class PlayGroundsController < ApplicationController
  before_action :set_play_ground, only: [:show, :edit, :update, :destroy]
  before_action :set_array_for_select_form, only: [:new, :edit, :update]

  # GET /play_grounds
  # GET /play_grounds.json
  def index
    @places = PlayGround.all

    markers = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat(place.latitude)
      marker.lng(place.longitude)
      marker.infowindow(render_to_string(partial: "play_grounds/infowindow", locals: { place: place }))
    end
    @markers_json = JSON.dump(markers)

    @criteria_marker_json = JSON.dump(user_signed_in? && current_user.city.present? ? PlayGround.get_criteria_latlng(markers[0], current_user) : markers[0])
  end

  # GET /play_grounds/1
  # GET /play_grounds/1.json
  def show
    @court = PlayGround.disp_court_infos(@play_ground)
    @court_images = PlayGroundImage.get_images(@play_ground.id)
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
    court_params = PlayGroundImage.save_format(@play_ground.id, play_ground_params.to_h, controller_name)
    respond_to do |format|
      if @play_ground.update(court_params)
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

    # select_formで使用する配列
    def set_array_for_select_form
      @places, @statuses, @weeks = PlayGround.arrays_for_select_form
    end

    # Only allow a list of trusted parameters through.
    def play_ground_params
      params_array = [
        :address,
        :latitude,
        :longitude,
        :court_name,
        :content,
        :place,
        :status,
        :image_first,
        :image_second,
        :image_third,
        :release,
        :nearest_station,
        :start_time,
        :end_time,
        :usage_fee,
        :usage_week => []
      ]

      req_params = params.require(:play_ground).permit(params_array)
      req_params.merge(user_id: current_user.id) if current_user.present?
    end
end

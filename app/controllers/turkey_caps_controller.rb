class TurkeyCapsController < ApplicationController
  before_action :set_turkey_cap, only: [:show, :edit, :update, :destroy]
  before_action :build_lists, only: [:new, :create, :edit, :update]

  # GET /turkey_caps
  def index
    if user_signed_in? && current_user.holiday_bird_caps
      @turkey_caps = TurkeyCap.all
    else
      redirect_to signout_path and return
    end
  end

  # GET /turkey_caps/1
  def show
  end

  # GET /turkey_caps/new
  def new
    @new = true
    @turkey_cap = TurkeyCap.new
  end

  # GET /turkey_caps/1/edit
  def edit
    @new = false
  end

  # POST /turkey_caps
  def create
    @turkey_cap = TurkeyCap.new(turkey_cap_params)

    respond_to do |format|
      if @turkey_cap.save
        format.html { redirect_to turkey_caps_url, notice: 'Turkey cap was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /turkey_caps/1
  def update
    respond_to do |format|
      if @turkey_cap.update(turkey_cap_params)
        format.html { redirect_to turkey_caps_url, notice: 'Turkey cap was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /turkey_caps/1
  def destroy
    @turkey_cap.destroy
    respond_to do |format|
      format.html { redirect_to turkey_caps_url, notice: 'Turkey cap was successfully deleted.' }
    end
  end

  def import
    TurkeyCap.import(params[:file])
    redirect_to root_url, notice: "Turkey caps imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turkey_cap
      @turkey_cap = TurkeyCap.find(params[:id])
    end

    def build_lists
      @dc = ["CO", "GA", "IL", "NJ", "TX"]
      @channel = ["CON", "FS", "RET"]
      @part = ["CHICAP001", "CHICAP002", "CHICAP003", "GEENAT001", "GEETAT002"]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def turkey_cap_params
      params.require(:turkey_cap).permit(:dc, :channel, :part, :cap)
    end
end

class BlazonsController < ApplicationController
  before_action :set_blazon, only: [:show, :edit, :update, :destroy]

  # GET /blazons
  # GET /blazons.json
  def index
    @blazons = Blazon.all
  end

  # GET /blazons/1
  # GET /blazons/1.json
  def show
    @blazons = Blazon.find_by(user_id: params[:uuid])
  end

  # GET /blazons/new
  def new
    @blazon = Blazon.new
  end

  # GET /blazons/1/edit
  def edit
  end

  # POST /blazons
  # POST /blazons.json
  def create
    @blazon = Blazon.new(params.require(:blazon).permit(:body, :user_id))

    respond_to do |format|
      if @blazon.save
        format.html { redirect_to user_blazons_path(@blazon.user_id), notice: 'Blazon was successfully created.' }
        format.json { render :show, status: :created, location: @blazon }
      else
        format.html { render :new }
        format.json { render json: @blazon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blazons/1
  # PATCH/PUT /blazons/1.json
  def update
    respond_to do |format|
      if @blazon.update(blazon_params)
        format.html { redirect_to @blazon, notice: 'Blazon was successfully updated.' }
        format.json { render :show, status: :ok, location: @blazon }
      else
        format.html { render :edit }
        format.json { render json: @blazon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blazons/1
  # DELETE /blazons/1.json
  def destroy
    @blazon.destroy
    respond_to do |format|
      format.html { redirect_to blazons_url, notice: 'Blazon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blazon
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blazon_params
      params[:blazon]
    end
end

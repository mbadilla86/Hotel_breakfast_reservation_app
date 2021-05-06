class BreakfastsController < ApplicationController
  before_action :set_breakfast, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, unless: :devise_controller?

  # GET /breakfasts or /breakfasts.json
  def index
    @breakfasts = Breakfast.all
  end

  # GET /breakfasts/1 or /breakfasts/1.json
  def show
  end

  # GET /breakfasts/new
  def new
    @breakfast = Breakfast.new
  end

  # GET /breakfasts/1/edit
  def edit
  end

  # POST /breakfasts or /breakfasts.json
  def create
    @breakfast = Breakfast.new(breakfast_params)

    respond_to do |format|
      if @breakfast.save
        format.html { redirect_to @breakfast, notice: "Breakfast was successfully created." }
        format.json { render :show, status: :created, location: @breakfast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @breakfast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breakfasts/1 or /breakfasts/1.json
  def update
    respond_to do |format|
      if @breakfast.update(breakfast_params)
        format.html { redirect_to @breakfast, notice: "Breakfast was successfully updated." }
        format.json { render :show, status: :ok, location: @breakfast }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @breakfast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breakfasts/1 or /breakfasts/1.json
  def destroy
    @breakfast.destroy
    respond_to do |format|
      format.html { redirect_to breakfasts_url, notice: "Breakfast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breakfast
      @breakfast = Breakfast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def breakfast_params
      params.require(:breakfast).permit(:reservation_id, :date)
    end
end

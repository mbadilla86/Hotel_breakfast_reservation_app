class UserBreakfastsController < ApplicationController
  before_action :set_user_breakfast, only: %i[ show edit update destroy ]

  # GET /user_breakfasts or /user_breakfasts.json
  def index
    @user_breakfasts = UserBreakfast.all
  end

  # GET /user_breakfasts/1 or /user_breakfasts/1.json
  def show
  end

  # GET /user_breakfasts/new
  def new
    @user_breakfast = UserBreakfast.new
    @times = UserBreakfast.times.map {|k,v| [k,v] }
    @places = UserBreakfast.places.map {|k,v| [k,v] }
  end

  # GET /user_breakfasts/1/edit
  def edit
  end

  # POST /user_breakfasts or /user_breakfasts.json
  def create
    @user_breakfast = UserBreakfast.new(user_breakfast_params)

    respond_to do |format|
      if @user_breakfast.save
        format.html { redirect_to @user_breakfast, notice: "User breakfast was successfully created." }
        format.json { render :show, status: :created, location: @user_breakfast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_breakfast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_breakfasts/1 or /user_breakfasts/1.json
  def update
    respond_to do |format|
      if @user_breakfast.update(user_breakfast_params)
        format.html { redirect_to @user_breakfast, notice: "User breakfast was successfully updated." }
        format.json { render :show, status: :ok, location: @user_breakfast }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_breakfast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_breakfasts/1 or /user_breakfasts/1.json
  def destroy
    @user_breakfast.destroy
    respond_to do |format|
      format.html { redirect_to user_breakfasts_url, notice: "User breakfast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_breakfast
      @user_breakfast = UserBreakfast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_breakfast_params
      params.require(:user_breakfast).permit(:user_id, :breakfast_id, :place, :time)
    end
end

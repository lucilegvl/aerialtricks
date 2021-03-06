class TricksController < ApplicationController
skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_trick, only: %i[ show edit update destroy ]

  # GET /tricks or /tricks.json
  def index
    @tricks = Trick.all
  end

  # GET /tricks/1 or /tricks/1.json
  def show
  end

  # GET /tricks/new
  def new
    @trick = Trick.new
  end

  # GET /tricks/1/edit
  def edit
  end

  # POST /tricks or /tricks.json
  def create

    #before_action :user_signed_in?

    @trick = Trick.new(trick_params)

    respond_to do |format|
      if @trick.save
        format.html { redirect_to trick_url(@trick), notice: "Trick was successfully created." }
        format.json { render :show, status: :created, location: @trick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tricks/1 or /tricks/1.json
  def update
    respond_to do |format|
      if @trick.update(trick_params)
        format.html { redirect_to trick_url(@trick), notice: "Trick was successfully updated." }
        format.json { render :show, status: :ok, location: @trick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tricks/1 or /tricks/1.json
  def destroy
    @trick.destroy

    respond_to do |format|
      format.html { redirect_to tricks_url, notice: "Trick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trick
      @trick = Trick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trick_params
      params.require(:trick).permit(:name, :person, :description, :difficulty, :picture)
    end
end

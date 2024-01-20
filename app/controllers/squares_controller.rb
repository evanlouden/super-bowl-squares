class SquaresController < ApplicationController
  before_action :set_square, only: %i[ show edit update destroy ]

  # GET /squares or /squares.json
  def index
    @squares = Square.all
  end

  # GET /squares/1 or /squares/1.json
  def show
  end

  # GET /squares/new
  def new
    @square = Square.new
  end

  # GET /squares/1/edit
  def edit
  end

  # POST /squares or /squares.json
  def create
    @square = Square.new(square_params)

    respond_to do |format|
      if @square.save
        format.html { redirect_to square_url(@square), notice: "Square was successfully created." }
        format.json { render :show, status: :created, location: @square }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @square.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squares/1 or /squares/1.json
  def update
    respond_to do |format|
      if @square.update(square_params)
        format.html { redirect_to square_url(@square), notice: "Square was successfully updated." }
        format.json { render :show, status: :ok, location: @square }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @square.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squares/1 or /squares/1.json
  def destroy
    @square.destroy!

    respond_to do |format|
      format.html { redirect_to squares_url, notice: "Square was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_square
      @square = Square.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def square_params
      params.require(:square).permit(:game_id, :x, :y)
    end
end

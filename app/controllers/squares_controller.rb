class SquaresController < ApplicationController
  before_action :set_square, only: %i[ show edit update ]

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

  # PATCH/PUT /squares/1 or /squares/1.json
  def update
    respond_to do |format|
      if @square.update(square_params)
        format.turbo_stream
        format.html { redirect_to square_url(@square), notice: "Square was successfully updated." }
        format.json { render :show, status: :ok, location: @square }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @square.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_square
      @square = Square.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def square_params
      params.permit(:user_id)
    end
end

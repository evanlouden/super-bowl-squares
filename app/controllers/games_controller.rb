class GamesController < ApplicationController
  def show
    @game = Game.includes(:headers, :squares).find(params[:id])
    @find_square = Services::FindSquare.new(@game)
  end

  def new
    @game = Game.new
  end


  def create
    @game = current_user.games.new(game_params)

    if @game.save
      Services::CreateSquares.new(@game).call
      render turbo_stream: turbo_stream.action(:redirect, game_path(@game))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    return if @game.user != current_user

    @game.destroy!
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def game_params
    params.require(:game).permit(:square_price)
  end
end

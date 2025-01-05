class GamesController < ApplicationController
  def show
    @game = Game.includes(:headers, :squares).find_by!(share_code: params[:id].upcase)
    @find_square = Services::FindSquare.new(@game)
  end

  def new
    @game = Game.new
  end


  def create
    @game = current_user.games.new(game_params)

    if @game.save
      Services::CreateSquares.new(@game).call
      Services::AssignNumbers.new(@game).call
      render turbo_stream: turbo_stream.action(:redirect, game_path(@game.share_code))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = current_user.games.find_by!(share_code: params[:id])

    @game.destroy!

    render turbo_stream: turbo_stream.action(:redirect, user_path(current_user))
  end

  private

  def game_params
    params.require(:game).permit(:square_price)
  end
end

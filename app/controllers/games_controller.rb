class GamesController < ApplicationController
  def show
    @game = Game.includes(:headers, :squares).find(params[:id])
  end

  def new
    @game = Game.new
  end


  def create
    @game = current_user.games.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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

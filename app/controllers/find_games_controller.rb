class FindGamesController < ApplicationController
  def new
    @form = Forms::FindGameForm.new
  end

  def create
    @form = Forms::FindGameForm.new(form_params)


    if @form.valid?
      redirect_to game_path(@form.game)
    else
      render turbo_stream: turbo_stream.replace(
        "find_game",
        partial: "find_games/form"
      )
    end
  end

  def form_params
    params.require(:forms_find_game_form).permit(:share_code)
  end
end

class FindGamesController < ApplicationController
  def new
    @form = Forms::FindGameForm.new
  end

  def index
    @form = Forms::FindGameForm.new(form_params)

    if @form.valid?
      render turbo_stream: turbo_stream.action(:redirect, game_path(@form.game))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def form_params
    params.require(:forms_find_game_form).permit(:share_code)
  end
end

class UsersController < ApplicationController
  def show #show.html.erbを表示
    @user = User.find(params[:id])
    @kanji = "漢字"
  end
end

module ApplicationHelper
  def controller?(controller)
    controller.include?(params[:controller]) #引数が現在のコントローラーを含んでいたらtrue
  end

  def action?(action)
    action.include?(params[:action]) #引数が現在のactionを含んでいたらtrue
  end



end

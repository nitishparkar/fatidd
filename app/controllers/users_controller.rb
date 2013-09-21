class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @date = params[:date].present? && Date.parse(params[:date]) ? Date.parse(params[:date]) : Date.today
    @tasks = @user.tasks.where(task_date: @date)
  end

end

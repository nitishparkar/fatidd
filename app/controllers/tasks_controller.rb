class TasksController < ApplicationController

  def create

  end

  def update

  end

  def index
    @date = params[:date].present? && Date.parse(params[:date]) ? Date.parse(params[:date]) : Date.today
    @task_groups = Task.includes(:user).where(task_date: @date).group_by(&:user)
  end

  def destroy

  end

end

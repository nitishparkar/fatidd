class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :emails

  def emails
    if request.headers["Authorization"] != API_KEY
      return head(:unauthorized)
    end

    tasks, email, task_date = UserMailer.receive(params[:email][:raw])
    Task.add_parsed_tasks(tasks, email, task_date)

    head :ok
  end

end

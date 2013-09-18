class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :emails

  def emails
    if request.headers["Authorization"] != API_KEY
      return head(:unauthorized)
    end
    UserMailer.receive(params[:email][:raw])
    head :ok
  end

end

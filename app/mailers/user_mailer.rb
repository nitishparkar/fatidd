class UserMailer < ActionMailer::Base
  def receive(raw)
    Rails.logger.debug(">>>>> #{raw}")
  end
end

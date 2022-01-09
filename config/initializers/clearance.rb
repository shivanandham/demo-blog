Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end

module Clearance
  # overwritting the clearance default methods for current_user and sign_out
  class Session
    def current_user
      @current_user ||= user_from_remember_token(remember_token)
    end
  end
end

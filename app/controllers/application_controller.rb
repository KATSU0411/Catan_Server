# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate!

  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization
  include Errors
  include Rescueable

  def current_user
    @current_user ||= current_session.try(:user)
  end

  def current_session
    @current_session ||= authenticate_with_http_token { |token| UserSession.find_by(access_token: token) }
  end

  def authenticate!
    return render_error UnAuthorizedError.new unless current_session
    return render_error SessionExpiredError.new if current_session.expired?

    current_session.update_expiration!
  end
end

module Authentication
  def login(request)
    session = FactoryBot.create(:user_session)
    request.headers["Authorization"] = "Token " + session.access_token
  end
end

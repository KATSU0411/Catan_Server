class UserSessionSerializer < ActiveModel::Serializer
  attributes :user_session_id, :access_token, :user_id

  def user_session_id
    object.id
  end
end

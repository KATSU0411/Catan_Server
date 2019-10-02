class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :name, :created_at, :updated_at

  def user_id
    object.id
  end
end

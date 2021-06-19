class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :email, :image

  def image
    object.image.service_url if object.image.attached?
  end
end

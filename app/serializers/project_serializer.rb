class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :total_sum, :image
  has_one :user

  def image
    object.image.service_url if object.image.attached?
  end
end

class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :patronymic, :birthday, :charachteristics
  has_one :user
end

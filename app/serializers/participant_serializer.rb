class ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :status
  has_one :user
  has_one :project
end

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :project

  before_create :default_status

  def default_status
    self.status = 'pending'
  end
end

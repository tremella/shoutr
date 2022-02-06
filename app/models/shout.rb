class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  default_scope { order(created_at: :desc) } # to change this, we can append .reorder to this.
  # generally avoid default_scope

  delegate :username, to: :user #grabs user FROM username when we call shout.username
end

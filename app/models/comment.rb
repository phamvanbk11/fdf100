class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  delegate :name, to: :user, prefix: :user, allow_nil: true
  delegate :avatar, to: :user, prefix: :user, allow_nil: true

  after_create_commit { create_event }

  scope :newest, ->{order created_at: :desc}

  private
  def create_event
    Event.create message: "",
      user_id: self.commentable.user.id, eventable_id: id, eventable_type: Product.name
  end
end

class Event < ActiveRecord::Base
  has_many :attending_events, dependent: :destroy # attending_event objects connecting user

  # the following 2 queries do the same thing, but 2nd has an assigned name (helper)
  has_many :users, through: :attending_events # users attending this event
  # has_many :users_attending, through: :attending_events, source: :user # alternative for calling users attending

  has_many :comments, dependent: :destroy # comments

  belongs_to :user, required: true

  validates :name, :date, :city, :state, presence: true
  validates :state, length: { is: 2 }
  validates :name, :city, length: { in: 2..100 }
  validates_date :date, :on => :create, :on_or_after => :today

end

class Message < ActiveRecord::Base
  belongs_to :person
  belongs_to :event
  validates :person, presence: true
  validates :event, presence: true
  validates :text, presence: true
  validates :date, presence: true
end

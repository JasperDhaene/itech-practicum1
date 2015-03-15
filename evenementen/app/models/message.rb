class Message < ActiveRecord::Base

  belongs_to :person
  belongs_to :event

  #
  # No uniqueness on messages is enforced
  #

  validates :person, presence: true
  validates :event, presence: true
  validates :text, presence: true
  validates :date, presence: true

end

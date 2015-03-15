class Event < ActiveRecord::Base

  #
  # event.messages
  #
  has_many :messages, -> { order 'date desc' }, dependent: :destroy
  #
  # event.people
  # person.events
  #
  has_and_belongs_to_many :people, -> { uniq }

  #
  # No uniqueness on events is enforced
  #

  validates :title, presence: true
  validates :text, presence: true
  validates :startdate, presence: true
  validates_datetime :startdate, :on_or_before => :enddate
  validates :enddate, presence: true

end

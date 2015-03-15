class Person < ActiveRecord::Base

  #
  # person.messages
  #
  has_many :messages, -> { order 'date desc' }, dependent: :destroy
  #
  # person.events
  # event.people
  #
  # Uniqueness in HABTM relations is enforced in the database ()
  #
  has_and_belongs_to_many :events, -> { uniq }

  #
  # No uniqueness on people is enforced. This is due to organizations
  # having possibly only one email address and a lot of people.
  #

  validates :name, presence: true
  validates :email, presence: true
  #
  # A regex for valid domains - and intrinsically a valid domain - is still
  # a subject for discussion. As such this model won't abide by RFC1035 and
  # simply check for the presence of the '@'-symbol. Browsers may apply
  # further restrictions as specified by the <input type="email"> element.
  #
  validates_format_of :email, :with => /@/
  validates :birthdate, presence: true
  validates_date :birthdate, :on_or_before => lambda { Date.current }

end

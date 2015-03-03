class Person < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :events

  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /@/
  validates :birthdate, presence: true
end

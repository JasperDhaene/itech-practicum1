class Event < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :people

  validates :title, presence: true
  validates :text, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
end

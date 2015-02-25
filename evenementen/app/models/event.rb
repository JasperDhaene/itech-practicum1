class Event < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true
end

class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: false

  belongs_to :user
  has_one_attached :avatar
  has_and_belongs_to_many :activities

  def total_amount
    activities.sum(:amount)
  end
end

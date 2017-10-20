class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  enum status: {handled: 0, not_handle: 1}
  validates :phone, presence: true, numericality: true
  validates :address, presence: true
  scope :sort_by_id, ->{order :id}
  scope :count_date, ->{order("DATE(created_at)").group("DATE(created_at)")}
  scope :count_month, ->{order("MONTH(created_at)").group("MONTH(created_at)")}
  scope :count_year, ->{order("YEAR(created_at)").group("YEAR(created_at)")}
  scope :find_order, ->(id){where user_id: id}
end

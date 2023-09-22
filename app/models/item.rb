class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_method
  belongs_to :delivery_date
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name,        presence: true, length: { in: 1..40 }
  validates :image,       presence: true
  validates :description, presence: true, length: { in: 1..1000 }
  validates :price,       presence: true, numericality: { in: 300..9_999_999, only_integer: true }

  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_method_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,      numericality: { other_than: 1, message: "can't be blank" }
end

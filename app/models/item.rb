class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_method
  belongs_to :delivery_date
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :user presence: true

  validates :category_id, :condition_id, :delivery_method_id, :delivery_date_id, :prefecture_id numericality: { other_than: 1 , message: "can't be blank"}

end

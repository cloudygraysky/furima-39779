class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_method
  belongs_to :delivery_date
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image
end

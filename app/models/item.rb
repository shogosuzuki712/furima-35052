class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee_burden
  belongs_to :prefecture
  belongs_to :ship_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :ship_date_id
  end

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ } do
      validates :price
    end
  end
end

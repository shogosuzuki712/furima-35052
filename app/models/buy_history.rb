class BuyHistory
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :token
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end
  
  validates :prefecture_id, numericality: { other_than: 1 }
  
  with_options presence: true do
    validates :city
    validates :block
    validates :user_id
    validates :item_id
    with_options format: { with: /\A\d{10,11}\z/ } do
      validates :phone_number
    end
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end

end


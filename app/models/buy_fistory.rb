class BuyHistroy
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building_name, :phone_number, :history_id, :user_id, :item_id
  
  with_options presence: true do
    validates :postcode
    validates :city
    validates :block
    validates :building_name
    validates :phone_number
    validates :history_id
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, :numericality { other_than: 1 }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end

end


FactoryBot.define do
  factory :buy_history do
    token         { 'tok_abcdefghijk00000000000000000' }
    prefecture_id { 2 }
    city          { '四日市' }
    block         { '諏訪町' }
    postcode      { '000-0000' }
    building_name { '田中ビル102' }
    phone_number  { '00000000000' }
  end 
end

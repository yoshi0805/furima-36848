FactoryBot.define do
  factory :trading_record_shipping_address do
    token                {'111111'}
    postal_code          {'000-0000'}
    prefecture_id        {'2'}
    municipality         {'大阪市'}
    address              {'平野区西脇1-1-1'}
    building_name        {'テスト'}
    phone_number         { '11111111111'}
    user_id              { '1' }
    item_id              { '1' }
  end
end

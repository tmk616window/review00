FactoryBot.define do
  factory :message do
    name {"イベント"}
    date {"2020/7/30"}
    content {"勉強会"}
    message_coment {"よろしくお願いします"}
    message_place {"東京駅"}
    people {5}
    user
  end
end

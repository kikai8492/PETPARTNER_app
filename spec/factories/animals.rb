FactoryBot.define do
  factory :animal_dog,class: Animal do
    id { 1 }
    pet_type { "犬" }
    pet_name { "ポチ" }
    sex { "オス" }
    age { "0~3ヶ月" }
    vaccinated { "接種済み" }
    spayed_neutered { "去勢済み" }
    note { "とても元気です" }
    prefecture { "東京都" }
    user_id { 1 }
  end

  factory :animal_cat,class: Animal do
    pet_type { "猫" }
    pet_name { "ミー" }
    sex { "オス" }
    age { "0~3ヶ月" }
    vaccinated { "接種済み" }
    spayed_neutered { "去勢済み" }
    note { "とても元気です" }
    prefecture { "東京都" }
    user_id { 1 }
  end
end


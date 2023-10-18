FactoryBot.define do
  factory :admin, class: User do
    id { 1 }
    # icon { "download-2.jpg" }
    email { "admin@icloud.com" }
    password { "aaaaaa" }
    last_name { "admin" }
    first_name { "user" }
    nick_name { "admin_user" }
    postal_code { "111111" }
    # prefecture { "東京都" }
    municipality { "渋谷区" }
    street_address { "渋谷" }
    movable_range { 1 }
    # sex { "男" }
    # occupation { "会社員" }
    phone_number { "000000000" }
    self_introduction { "admin_userです。よろしくお願いします" }
    adnim { true }
  end

  factory :user1, class: User do
    id { 1 }
    icon { "download-2.jpg" }
    email { "user1@icloud.com" }
    password { "aaaaaa" }
    last_name { "test" }
    first_name { "user1" }
    nick_name { "test_user1" }
    postal_code { "111111" }
    prefecture { "東京都" }
    municipality { "渋谷区" }
    street_address { "渋谷" }
    movable_range { 1 }
    sex { "男" }
    occupation { "会社員" }
    phone_number { "11111111111" }
    self_introduction { "test_user1です。よろしくお願いします" }
    terms_of_use { "利用規約に同意しました" }
  end

  factory :user2, class: User do
    id { 3 }
    # icon { "download-2.jpg" }
    email { "user2@icloud.com" }
    password { "aaaaaa" }
    last_name { "test" }
    first_name { "user2" }
    nick_name { "test_user2" }
    postal_code { "111111" }
    prefecture { "東京都" }
    municipality { "渋谷区" }
    street_address { "渋谷" }
    movable_range { 1 }
    sex { "男" }
    occupation { "会社員" }
    phone_number { "222222222" }
    self_introduction { "test_user2です。よろしくお願いします" }
  end

  factory :user3, class: User do
    id { 1 }
    email { "user3@icloud.com" }
    password { "aaaaaa" }
    last_name { "test" }
    first_name { "user3" }
    nick_name { "test_user3" }
    postal_code { "333333" }
    prefecture { "東京都" }
    municipality { "渋谷区" }
    street_address { "渋谷" }
    movable_range { 1 }
    sex { "男" }
    occupation { "会社員" }
    phone_number { "333333" }
    self_introduction { "test_user3です。よろしくお願いします" }
  end
end

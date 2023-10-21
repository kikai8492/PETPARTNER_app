FactoryBot.define do
  

  factory :user1, class: User do
    icon {Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/profile_image.jpg'), 'image/jpeg')}
    id { 1 }
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
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


questions = [
  "質問1:あなたは毎日一定の時間、ペットの世話をすることができますか？",
  "質問2:あなたはペットの世話をするために、毎月一定の金額を費やすことができますか？(犬の場合は1ヶ月約1万円、猫の場合は1ヶ月約5000円)",
  "質問3:ペットが病気や怪我をした際、直ちに動物病院に連れて行くなど緊急の対応ができますか？",
  "質問4:あなたまたは家族がアレルギーの症状を持っていませんか？",
  "質問5:あなたの住んでいる場所でペットを飼うことは許されていますか？",
  "質問6:定期的に散歩などの運動やふれあいの時間をペットと共有できますか？",
  "質問7:定期的に転勤や引っ越しをする頻度は少なめですか？",
  "質問8:長期的なパートナーとして、最後まで世話する覚悟ができていますか？（猫や犬の寿命はおおよそ10年から20年程度です）", 
  "質問9:犬や猫の特有の行動や性格を学び、理解しようとする意欲がありますか？",
  "質問10:必要に応じて、ペットのしつけや訓練を行うことができますか？"
]

questions.each do |question|
  Question.create!(query: question)
end

10.times do |i|
  User.create!(
    email: "kikai#{i+1}@icloud.com",
    password: "aaaaaa",
    last_name: "hugahuga#{i+1}",
    first_name: "hogehoge#{i+1}",
    nick_name: "user#{i+1}",
    postal_code: "12345#{i + 1}",
    prefecture: "東京都",
    municipality: "渋谷区",
    street_address: "渋谷#{i+1}",
    movable_range: 1,
    sex: "男",
    occupation: "会社員",
    phone_number: "090123456#{i + 1}",
    admin: false,
    icon: "download-2.jpg",
    self_introduction: "user#{i + 1}です。よろしくお願いします",
    terms_of_use: "利用規約に同意しました"
  )
end


User.create!(
  email: "yysskikai05@icloud.com",
  password: "PKPKkikai321",
  last_name: "脩斗",
  first_name: "鬼海",
  nick_name: "kikai",
  postal_code: "12345",
  prefecture: "東京都",
  municipality: "渋谷区",
  street_address: "渋谷",
  movable_range: 1,
  sex: "男",
  occupation: "会社員",
  phone_number: "090123456#",
  admin: true,
  icon: "download-2.jpg",
  self_introduction: "kikaiです。よろしくお願いします",
  terms_of_use: "利用規約に同意しました"
)

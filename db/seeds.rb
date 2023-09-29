# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  icon: "子犬2.jpeg",
  last_name: "鬼海",
  first_name: "脩斗",
  nick_name: "kikiai",
  phone_number: "08039522795",
  email: "yysskikai04@icloud.com",
  password: "PKPKkikai321",
  password_confirmation: "PKPKkikai321",
  postal_code: "8620913",
  prefecture: "熊本県", 
  municipality: "熊本市東区尾ノ上",
  street_address: "4丁目12-60 201号",
  movable_range: 0,
  sex: "男性",
  occupation: "会社員",
  self_introduction: "よろしくお願いします。",
  admin: true
)
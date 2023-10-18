require "rails_helper"
RSpec.describe 'userモデル機能', type: :model do
  context 'userのアイコンが空の場合' do
    it 'バリデーションにひっかる' do
      user = User.new(icon:"",email:"exam@exam.com",phone_number:"000000",password:"aaaaaa",last_name:"fugafuga",first_name:"hogehoge",nick_name:"hogefuga
        ",postal_code:"000000",prefecture:"東京都",municipality:"渋谷区",street_address:"渋谷",movable_range: 0,sex:"男",occupation:"会社員",self_introduction:"よろしく",terms_of_use:"利用規約に同意しました")
      expect(user).not_to be_valid
    end
  end
end
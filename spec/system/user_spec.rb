require 'rails_helper'
RSpec.describe 'ユーザー登録及び飼い主チェッカー', type: :system do
  let!(:user1) { FactoryBot.build(:user1) }
  describe 'ユーザー登録のテスト' do
    context 'ユーザー新規登録した場合' do
      it 'ユーザー新規登録及び飼い主チェッカー画面に飛ぶこと' do
        visit new_user_registration_path
        attach_file 'user[icon]', "#{Rails.root}/spec/factories/profile_image.jpg"
        fill_in 'user_email', with: user1.email
        fill_in 'user_phone_number', with: user1.phone_number
        fill_in 'user_password', with: user1.password
        fill_in 'user_password_confirmation', with: user1.password
        fill_in 'user_last_name', with: user1.last_name
        fill_in 'user_first_name', with: user1.first_name
        fill_in 'user_nick_name', with: user1.nick_name
        fill_in 'user_postal_code', with: user1.postal_code
        select '東京都', from: 'user_prefecture'
        fill_in 'user_municipality', with: user1.municipality
        fill_in 'user_street_address', with: user1.street_address
        select '0~50km', from: 'user_movable_range'
        select '男', from: 'user_sex'
        select '会社員', from: 'user_occupation'
        fill_in 'user_self_introduction', with: user1.self_introduction
        check 'user_terms_of_use'
        click_on 'Sign up'

        expect(page).to have_content '飼い主チェッカー'
      end
    end
  end

  describe '飼い主チェッカーのテスト' do
    context '飼い主チェッカーを実行した場合' do
      it '飼い主チェッカーの結果が表示されること' do
        visit new_user_registration_path
        attach_file 'user[icon]', "#{Rails.root}/spec/factories/profile_image.jpg"
        fill_in 'user_email', with: user1.email
        fill_in 'user_phone_number', with: user1.phone_number
        fill_in 'user_password', with: user1.password
        fill_in 'user_password_confirmation', with: user1.password
        fill_in 'user_last_name', with: user1.last_name
        fill_in 'user_first_name', with: user1.first_name
        fill_in 'user_nick_name', with: user1.nick_name
        fill_in 'user_postal_code', with: user1.postal_code
        select '東京都', from: 'user_prefecture'
        fill_in 'user_municipality', with: user1.municipality
        fill_in 'user_street_address', with: user1.street_address
        select '0~50km', from: 'user_movable_range'
        select '男', from: 'user_sex'
        select '会社員', from: 'user_occupation'
        fill_in 'user_self_introduction', with: user1.self_introduction
        check 'user_terms_of_use'
        click_on 'Sign up'

        select '当てはまる', from: 'option_answer1'
        select '当てはまる', from: 'option_answer2'
        select '当てはまる', from: 'option_answer3'
        select '当てはまる', from: 'option_answer4'
        select '当てはまる', from: 'option_answer5'
        select '当てはまる', from: 'option_answer6'
        select '当てはまる', from: 'option_answer7'
        select '当てはまる', from: 'option_answer8'
        select '当てはまる', from: 'option_answer9'
        select '当てはまる', from: 'option_answer10'

        click_on '診断する'

        expect(page).to have_content 'test_user1の飼い主チェッカー結果'
      end
    end
  end

  describe '飼い主チェッカー後にanimals/index画面に飛ぶこと' do
    context '飼い主チェッカーの結果を確認した場合' do
      it 'animals/index画面に飛ぶこと' do
        visit new_user_registration_path
        attach_file 'user[icon]', "#{Rails.root}/spec/factories/profile_image.jpg"
        fill_in 'user_email', with: user1.email
        fill_in 'user_phone_number', with: user1.phone_number
        fill_in 'user_password', with: user1.password
        fill_in 'user_password_confirmation', with: user1.password
        fill_in 'user_last_name', with: user1.last_name
        fill_in 'user_first_name', with: user1.first_name
        fill_in 'user_nick_name', with: user1.nick_name
        fill_in 'user_postal_code', with: user1.postal_code
        select '東京都', from: 'user_prefecture'
        fill_in 'user_municipality', with: user1.municipality
        fill_in 'user_street_address', with: user1.street_address
        select '0~50km', from: 'user_movable_range'
        select '男', from: 'user_sex'
        select '会社員', from: 'user_occupation'
        fill_in 'user_self_introduction', with: user1.self_introduction
        check 'user_terms_of_use'
        click_on 'Sign up'

        select '当てはまる', from: 'option_answer1'
        select '当てはまる', from: 'option_answer2'
        select '当てはまる', from: 'option_answer3'
        select '当てはまる', from: 'option_answer4'
        select '当てはまる', from: 'option_answer5'
        select '当てはまる', from: 'option_answer6'
        select '当てはまる', from: 'option_answer7'
        select '当てはまる', from: 'option_answer8'
        select '当てはまる', from: 'option_answer9'
        select '当てはまる', from: 'option_answer10'
        click_on '診断する'
        click_on '結果を確認しました'
        expect(page).to have_content 'PETPARTNER'
      end
    end
  end
end
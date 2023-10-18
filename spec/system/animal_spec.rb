require 'rails_helper'
RSpec.describe 'PETPARTNER動作', type: :system do
  describe '動物登録テスト' do
    let!(:user1) { FactoryBot.build(:user1) }
    before do
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
    end
    context '動物登録した場合' do
      let!(:animal_dog) { FactoryBot.build(:animal_dog) }
      it '動物が一覧画面に登録されること' do
        click_on "掲載する"
        visit new_animal_path
        attach_file 'animal[images][]', "#{Rails.root}/spec/factories/dog.jpg"
        select '犬', from: 'animal_pet_type'
        fill_in 'animal_pet_name', with: animal_dog.pet_name
        select 'オス', from: 'animal_sex'
        select '0~3ヶ月', from: 'animal_age'
        select '接種済み', from: 'animal_vaccinated'
        select '去勢済み', from: 'animal_spayed_neutered'
        select '東京都', from: 'animal_prefecture'
        fill_in 'animal_note', with: animal_dog.note
        click_on "掲載する"

        expect(page).to have_selector("img[src$='dog.jpg']")

      end
    end
  end

  describe "検索機能" do
    let!(:user1) { FactoryBot.build(:user1) }
    let!(:animal_dog) { FactoryBot.build(:animal_dog) }
    before do
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
      click_on "掲載する"
      visit new_animal_path
      attach_file 'animal[images][]', "#{Rails.root}/spec/factories/dog.jpg"
      select '犬', from: 'animal_pet_type'
      fill_in 'animal_pet_name', with: animal_dog.pet_name
      select 'オス', from: 'animal_sex'
      select '0~3ヶ月', from: 'animal_age'
      select '接種済み', from: 'animal_vaccinated'
      select '去勢済み', from: 'animal_spayed_neutered'
      select '東京都', from: 'animal_prefecture'
      fill_in 'animal_note', with: animal_dog.note
      click_on "掲載する"
    end
    context "動物の種類で検索した場合" do
      it "動物の種類で検索できること" do
        visit animals_path
        select '猫', from: 'pet_type'
        click_on "検索する"
        expect(page).to have_content "動物が見つかりません"
      end
    end
    context "動物の種類と性別で検索した場合" do
      it "動物の種類と性別で検索できること" do
        visit animals_path
        select '犬', from: 'pet_type'
        select 'メス', from: 'sex'
        click_on "検索する"
        expect(page).to have_content "動物が見つかりません"
      end
    end
  end

  describe "動物詳細画面" do
    let!(:user1) { FactoryBot.build(:user1) }
    let!(:animal_dog) { FactoryBot.build(:animal_dog) }
    before do
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
      click_on "掲載する"
      visit new_animal_path
      attach_file 'animal[images][]', "#{Rails.root}/spec/factories/dog.jpg"
      select '犬', from: 'animal_pet_type'
      fill_in 'animal_pet_name', with: animal_dog.pet_name
      select 'オス', from: 'animal_sex'
      select '0~3ヶ月', from: 'animal_age'
      select '接種済み', from: 'animal_vaccinated'
      select '去勢済み', from: 'animal_spayed_neutered'
      select '東京都', from: 'animal_prefecture'
      fill_in 'animal_note', with: animal_dog.note
      click_on "掲載する"
    end
    context "動物詳細画面に遷移した場合" do
      it "動物詳細画面に動物の情報が表示されていること" do
        visit animals_path
        click_on "animal_image"
        expect(page).to have_content "犬"
        expect(page).to have_content "ポチ"
        expect(page).to have_content "オス"
        expect(page).to have_content "0~3ヶ月"
        expect(page).to have_content "接種済み"
        expect(page).to have_content "去勢済み"
        expect(page).to have_content "東京都"
        expect(page).to have_content "とても元気です"
      end
      it "動物の情報を編集できること" do
        visit animals_path
        click_on "animal_image"
        click_on "動物の情報を編集する"
        fill_in "animal_pet_name", with: "太郎"
        click_on "情報を上書きする"
        click_on "animal_image"
        expect(page).to have_content "太郎"
      end
    end
  end

  describe "チャット機能が使えること" do
    let!(:user1) { FactoryBot.build(:user1) }
    let!(:animal_dog) { FactoryBot.build(:animal_dog) }
    let!(:user2) { FactoryBot.build(:user2) }
    before do
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
      click_on "掲載する"
      visit new_animal_path
      attach_file 'animal[images][]', "#{Rails.root}/spec/factories/dog.jpg"
      select '犬', from: 'animal_pet_type'
      fill_in 'animal_pet_name', with: animal_dog.pet_name
      select 'オス', from: 'animal_sex'
      select '0~3ヶ月', from: 'animal_age'
      select '接種済み', from: 'animal_vaccinated'
      select '去勢済み', from: 'animal_spayed_neutered'
      select '東京都', from: 'animal_prefecture'
      fill_in 'animal_note', with: animal_dog.note
      click_on "掲載する"
      click_on "test_user1のマイページ"
      click_on "ログアウトする"
      visit new_user_registration_path
      attach_file 'user[icon]', "#{Rails.root}/spec/factories/profile_image.jpg"
      fill_in 'user_email', with: user2.email
      fill_in 'user_phone_number', with: user2.phone_number
      fill_in 'user_password', with: user2.password
      fill_in 'user_password_confirmation', with: user2.password
      fill_in 'user_last_name', with: user2.last_name
      fill_in 'user_first_name', with: user2.first_name
      fill_in 'user_nick_name', with: user2.nick_name
      fill_in 'user_postal_code', with: user2.postal_code
      select '東京都', from: 'user_prefecture'
      fill_in 'user_municipality', with: user2.municipality
      fill_in 'user_street_address', with: user2.street_address
      select '0~50km', from: 'user_movable_range'
      select '男', from: 'user_sex'
      select '会社員', from: 'user_occupation'
      fill_in 'user_self_introduction', with: user2.self_introduction
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
    end
    context "チャット画面に遷移した場合" do
      it "チャットができること" do
        click_on "animal_image"
        click_on "この動物に応募する"
        fill_in "chat_message", with: "こんにちは"
        click_on "送信"
        expect(page).to have_content "こんにちは"
      end
    end
  end

  describe "評価機能が使えること" do
    let!(:user1) { FactoryBot.build(:user1) }
    let!(:animal_dog) { FactoryBot.build(:animal_dog) }
    let!(:user2) { FactoryBot.build(:user2) }
    before do
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
      click_on "掲載する"
      visit new_animal_path
      attach_file 'animal[images][]', "#{Rails.root}/spec/factories/dog.jpg"
      select '犬', from: 'animal_pet_type'
      fill_in 'animal_pet_name', with: animal_dog.pet_name
      select 'オス', from: 'animal_sex'
      select '0~3ヶ月', from: 'animal_age'
      select '接種済み', from: 'animal_vaccinated'
      select '去勢済み', from: 'animal_spayed_neutered'
      select '東京都', from: 'animal_prefecture'
      fill_in 'animal_note', with: animal_dog.note
      click_on "掲載する"
      click_on "test_user1のマイページ"
      click_on "ログアウトする"
      visit new_user_registration_path
      attach_file 'user[icon]', "#{Rails.root}/spec/factories/profile_image.jpg"
      fill_in 'user_email', with: user2.email
      fill_in 'user_phone_number', with: user2.phone_number
      fill_in 'user_password', with: user2.password
      fill_in 'user_password_confirmation', with: user2.password
      fill_in 'user_last_name', with: user2.last_name
      fill_in 'user_first_name', with: user2.first_name
      fill_in 'user_nick_name', with: user2.nick_name
      fill_in 'user_postal_code', with: user2.postal_code
      select '東京都', from: 'user_prefecture'
      fill_in 'user_municipality', with: user2.municipality
      fill_in 'user_street_address', with: user2.street_address
      select '0~50km', from: 'user_movable_range'
      select '男', from: 'user_sex'
      select '会社員', from: 'user_occupation'
      fill_in 'user_self_introduction', with: user2.self_introduction
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
    end
    context "評価画面に遷移した場合" do
      it "評価ができること" do
        click_on "animal_image"
        click_on "この動物に応募する"
        click_on "取引相手を評価する"
        page.driver.browser.switch_to.alert.accept
        check "trading_evaluation_get_animal"
        choose 'trading_evaluation_score_良かった'
        fill_in 'trading_evaluation_feedback', with: "とても良かったです"
        click_on "評価する"

        expect(page).to have_content "取引相手を評価しました。以上で取引終了です。またのご利用をお待ちしております"
      end
    end
  end
end

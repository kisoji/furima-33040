require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context 'ユーザー登録ができる時' do
        it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
        end
        it "first_nameとfamily_name、first_name_kanaとfamily_name_kanaが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "fbirth_dayが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上であれば登録できること" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          expect(@user).to be_valid
        end
        it "passwordが半角英数字混合であれば登録できること" do
          @user.password = "111111a"
          @user.password_confirmation = "111111a"
          expect(@user).to be_valid
        end
        it 'メールアドレスは、@があれば登録できること' do
          @user.email = "(@)"
          @user.valid?
          expect(@user).to be_valid
        end
        it "first_nameとfamily_nameが全角であれば登録できること" do
          @user.first_name = "英二郎"
          @user.family_name = "駿台"
        expect(@user).to be_valid
      　end
        it "first_name_kanaとfamily_name_kanaが全角であれば登録できること" do
          @user.first_name_kana = "エイジロウ"
          @user.family_name_kana = "スンダイ"
          expect(@user).to be_valid
        end
    end
    
    context 'ユーザー登録ができない時' do
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end



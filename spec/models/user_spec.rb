require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとfamily_name、first_name_kanaとfamily_name_kana、birth_dayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123bbb'
        @user.password_confirmation = '124bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@を含まないと登録できないこと' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'kkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.family_name = '565656'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = 'ｶｶｶｶｶｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.family_name_kana = 'ｺｲﾃﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
      end

      it 'birth_dayが空では登録できないこと' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'passwordが6文字以上でないと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'yyyyyy'
        @user.password_confirmation = 'yyyyyy'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '333333'
        @user.password_confirmation = '333333'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが全角では登録できない' do
        @user.password = "９９９\bＫＫＫ"
        @user.password_confirmation = '９９９ＫＫＫ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
    end
  end
end

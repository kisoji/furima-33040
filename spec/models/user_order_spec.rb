require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば登録できる' do
      expect(@user_order).to be_valid
    end

    it '建物名がない場合も登録できる' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では登録できないこと' do
      @user_order.user_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では登録できないこと' do
      @user_order.item_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Item can't be blank")
    end

    it 'post_codeが空では登録できないこと' do
      @user_order.post_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
      @user_order.post_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Post code Input correctly')
    end

    it 'prefectureを選択していないと登録できないこと' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Prefecture Select')
    end

    it 'cityが空では登録できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'house numberが空では登録できないこと' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end

    it 'Phone numberが空では登録できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'Phone number12桁異常で登録できないこと' do
      @user_order.phone_number = '1234567890987'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'Phone numberにハイフンがある場合登録できないこと' do
      @user_order.phone_number = '03-4567-8909'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'Phone numberが数字以外では登録できないこと' do
      @user_order.phone_number = 'yyyyyy'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number Input correctly')
    end
  end
end

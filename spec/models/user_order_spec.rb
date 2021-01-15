require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user_order).to be_valid
  end

  it 'tokenが空では登録できないこと' do
    @user_order.token = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Token can't be blank")
  end

  it 'post_codeが空では登録できないこと' do
    @user_order.post_code = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Post code can't be blank")
  end

  it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @user_order.post_code = '1234567'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include('Post code Input correctly')
  end

  it 'prefectureを選択していないと保存できないこと' do
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

  it 'Phone numberが数字以外では登録できないこと' do
    @user_order.phone_number = 'yyyyyy'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include('Phone number Input correctly')
  end
end

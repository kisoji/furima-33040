require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品登録ができる時' do
      it 'image,name,introduction,category_id,condition_id,delivery_id,prefecture_id,preparation_id,priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品登録ができない時' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductionが空では登録できないこと' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'category_idでアクティブハッシュのidが1以外でないと登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idが空では登録できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      
      it 'condition_idでアクティブハッシュのidが1以外でないと登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      
      it 'delivery_idが空では登録できないこと' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery is not a number')
      end
      
      it 'delivery_idでアクティブハッシュのidが1以外でないと登録できないこと' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 1')
      end
      
      it 'prefecture_idが空では登録できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      
      it 'prefecture_idでアクティブハッシュのidが1以外でないと登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      
      it 'preparation_idが空では登録できないこと' do
        @item.preparation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation is not a number')
      end
      
      it 'preparation_idでアクティブハッシュのidが1以外でないと登録できないこと' do
        @item.preparation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation must be other than 1')
      end
      
      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは全角数字では登録できない' do
        @item.price = '９００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Input half-width numbers.','Price is out of setting range')
      end

      it 'priceは半角英数混合では登録できない' do
        @item.price = 'ko12'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Input half-width numbers.','Price is out of setting range')
      end
      
      it 'priceは半角英語では登録できない' do
        @item.price = 'koko'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Input half-width numbers.','Price is out of setting range')
      end
      
      it 'priceは299円以下では登録できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      
      it 'priceは10,000,000円以上では登録できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end

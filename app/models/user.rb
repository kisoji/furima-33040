class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
  validates :password, format: {with:VALID_PASSWORD_REGIX, message: "Include both letters and numbers"}
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :family_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :first_name_kana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  validates :family_name_kana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  validates :birth_day, presence: true
  has_many :items
  has_many :orders

end

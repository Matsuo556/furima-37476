class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name,        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' }
    validates :first_name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' }
    validates :last_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/, message: "全角(カタカナ)で入力して下さい" }
    validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "全角(カタカナ)で入力して下さい" }
    validates :birthday
  end

end

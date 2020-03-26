class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :name, presence:true, length:{in:2..20}
  validates :introduction, length:{maximum:50}
  def self.search(search) #self.はUser.を意味する
     if search
       User.where(['name LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
     else
       User.all #全て表示させる
    end
 end
end

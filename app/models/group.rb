class Group < ActiveRecord::Base
  belongs_to :user
  validates :name, :desc, presence: :true
  validates :name, length: { minimum: 5 }
  validates :desc, length: { minimum: 10 } 
  has_many :memberships, dependent: :delete_all
  has_many :users, through: :memberships
end

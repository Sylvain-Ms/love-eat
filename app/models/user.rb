class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :suggestions
  has_many :foodmoods
  has_many :likes
  has_many :conversations
  has_many :messages
  has_many :restaurants, through: :suggestions
  has_many :foodmoods_restaurants, through: :foodmoods
  has_many :messages_received, through: :conversations, class_name: "Message"
  validates :first_name, :last_name, :email, :password, :birthdate, :genre, :distance, presence: true
  validates :first_name, :last_name, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true
end

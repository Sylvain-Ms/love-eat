require 'date'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :suggestions
  has_many :foodmoods
  has_many :likes
  has_many_attached :pictures
  has_many :conversations
  has_many :messages
  has_many :restaurants, through: :suggestions
  has_many :foodmoods_restaurants, through: :foodmoods
  has_many :messages_received, through: :conversations, class_name: "Message"
  validates :first_name, :last_name, :email, :birthdate, :gender, :distance, presence: true
  validates :first_name, :last_name, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: true

  def age
    today = Date.today
    birthdate = self.birthdate
    return (today - birthdate.to_date).to_i / 365
  end
end

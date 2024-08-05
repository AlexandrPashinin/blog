# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_name              :string           default(""), not null
#  name                   :string           default(""), not null
#  nik_name               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :email, presence: true, length: { minimum:1, maximum: 50 }
  validates :name, presence: true, length: { minimum:1, maximum: 50 }
  validates :last_name, presence: true, length: { minimum:1, maximum: 50 }
  validates :nik_name, presence: false, length: { minimum:1, maximum: 50 }
  validates :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account                :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_one :profile, dependent: :destroy

  validates :account, presence: true, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  # def avatar_image
  #   if profile&.avatar&.attached?
  #     profile.avatar
  #   else
  #     'default-avatar.png'
  #   end
  # end

  def display_name
  end

end

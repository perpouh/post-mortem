# ユーザー
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable

  include DeviseTokenAuth::Concerns::User

  validates :username, ban_reserved: true, length: {in: 5..15}, uniqueness: { case_sensitive: false }
  validate :allow_domain_list

  def allow_domain_list
    return if email.blank?

    # 許可するドメインをどこで管理するかは後で考える。環境変数かDBか
    errors.add(:email, t('errors.not_acceptable_domain')) unless ['example.com'].any? {|v| email.end_with?(v) }
  end

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }
  validates :nickname, uniqueness: { case_sensitive: false }
end

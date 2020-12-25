# ユーザー
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable

  include DeviseTokenAuth::Concerns::User

  validate :allow_domain_list

  def allow_domain_list
    return if email.blank?

    # 許可するドメインをどこで管理するかは後で考える。環境変数かDBか
    errors.add(:email, 'メールアドレスが不正です。システムに許可されたドメイン以外は登録できません。') unless email.end_with?('co.jp')
  end
end

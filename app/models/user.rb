class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, presence: false, on: :facebook_login

  def self.from_omniauth(auth)
    # emailの提供は必須とする
    user = User.find_by(email: auth.info.email)
    user = User.new(
      uid:  auth.uid,
      name: auth.info.name,
      email: auth.info.email,
      image: auth.info.image,
      oauth_token: auth.credentials.token,
      oauth_expires_at: Time.at(auth.credentials.expires_at)
    ) if user.blank?
    [user.save(context: :facebook_login), user]
  end
end

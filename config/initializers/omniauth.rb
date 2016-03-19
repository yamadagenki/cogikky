Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'user_about_me,email,user_friends,user_photos', :display => 'popup',
           :info_fields => 'name, email' # ←追加する部分
end

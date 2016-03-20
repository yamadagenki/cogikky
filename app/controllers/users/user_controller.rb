module Users
  class UserController < UsersController
    def create
      return unless env['omniauth.auth'].present?

      result, user = User.from_omniauth(env['omniauth.auth']) if env['omniauth.auth'].present?

      return redirect_to users_auth_failure_path unless result

      auto_login(user)
      redirect_to root_path, notice: 'ログインしました。'
    end

    def destroy
      logout
      redirect_to root_path
    end
  end
end

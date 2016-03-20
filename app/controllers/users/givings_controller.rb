module Users
  class GivingsController < UsersController
    before_action :require_login, only: [:index]

    def index
    end

    def new
      raise
    end

    def destroy
    end
  end
end

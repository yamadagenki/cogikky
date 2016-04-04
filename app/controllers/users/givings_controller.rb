module Users
  class GivingsController < UsersController
    before_action :require_login, only: [:index]

    def index
    end

    def new
      @wish = Wish.find_by(id: params[:wish_id])
    end

    def destroy
    end
  end
end

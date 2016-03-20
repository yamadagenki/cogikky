module Users
  class WishesController < UsersController
    before_action :require_login, only: [:index, :new, :edit, :update, :destroy, :create]
    add_breadcrumb 'Cogikky', '/'

    def index
      @wishes = Wish.where(user_id: current_user.id)
    end

    def show
      @wish = Wish.find_by(id: params[:id])

      @category = Category.find_by_id(@wish.category_id)
      add_breadcrumb @category.name, users_category_path(@category.id)
      @user = User.find_by(id: @wish.user_id)

      add_breadcrumb @wish.title
    end

    def new
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def create
    end
  end
end

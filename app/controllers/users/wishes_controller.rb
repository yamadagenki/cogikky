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
      @wish = Wish.new
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def confirm
      @wish = Wish.new(wish_params)
    end

    def create
      @wish = Wish.new(wish_params)
      return redirect_to users_wish_path(wish.id), notice: '登録完了。恵んでもらうのをひたすら待ってください' if @wish.save

      render 'confirm'
    end

    private

    def wish_params
      params.require(:wish).permit(:user_id, :title, :category_id,
                                   :comment, :price_min, :price_max, :description,
                                   :image1, :image2, :image3,
                                   :image1_cache, :image2_cache, :image3_cache)
    end
  end
end

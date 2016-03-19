module Users
  class WishesController < UsersController
    add_breadcrumb 'Cogikky', '/'

    def show
      @wish = Wish.find_by(id: params[:id])

      @category = Category.find_by_id(@wish.category_id)
      add_breadcrumb @category.name, users_category_path(@category.id)
      @user = User.find_by(id: @wish.user_id)

      add_breadcrumb @wish.title
    end
  end
end

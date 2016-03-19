module Users
  class CategoriesController < UsersController
    add_breadcrumb 'Cogikky', '/'

    def show
      @category = Category.find_by_id(params[:id])
      add_breadcrumb @category.name

      @wishes = Wish.where(category_id: @category.id).page(params[:page])
    end
  end
end

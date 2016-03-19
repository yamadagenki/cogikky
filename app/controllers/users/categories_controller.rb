module Users
  class CategoriesController < UsersController
    add_breadcrumb 'Cogikky', '/'

    def show
      @category = Category.find_by_id(params[:id])
      add_breadcrumb @category.name
    end
  end
end

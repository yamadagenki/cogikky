module Users
  class CategoriesController < UsersController
    def show
      @category = Category.find_by_id(params[:id])
    end
  end
end

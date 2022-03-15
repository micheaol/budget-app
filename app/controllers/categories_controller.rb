class CategoriesController < ApplicationController
    # load_and_authorize_resource
    before_action :set_category, only: %i[show]


    def index
        @categories = current_user.categories
        p '=========='
        p @categories
        p '=========='
    end

    def show
        @activities = @category.activities.order(created_at: 'desc')
      end

    def new
        @category = Category.new
    end

    def create
        @new_category = current_user.categories.new(category_params)

       if @new_category.save!
            flash[:notice] = "Category created sucessfully"
        redirect_to categories_path

       else
            flash[:alert] = "Opps! something went wrong.. Try again"
       end
    end

    def set_category
        @category = Category.includes(:activities).find(params[:id])
      end



    private

    def category_params
      params.require(:category).permit(:name, :icon)
    end
end
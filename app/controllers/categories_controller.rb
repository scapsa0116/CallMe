class CategoriesController < ApplicationController
    def index
        @categories = Category.all.includes(:jobs)
      end
    
      def show
         @category = Category.find_by_id(params[:id])
      end
    
      def new
      end
end

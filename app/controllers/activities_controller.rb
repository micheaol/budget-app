class ActivitiesController < ApplicationController
    load_and_authorize_resource
    
    def index
       redirect_to categories_path
        
    end

    def new
        @entity_transaction = Activity.new
    end

    def create
        @entity_transaction = Activity.new(activity_params)
        @entity_transaction.author = current_user
        
        if @entity_transaction.save!
            flash[:notice] = "Transaction created successfully"
            redirect_to categories_path
        end
    end

    private

    def activity_params
        params.require(:entity).permit(:name, :amount, category_ids: [])
      end
end
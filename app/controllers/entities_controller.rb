class EntitiesController < ApplicationController
    # load_and_authorize_resource
    def index
       redirect_to categories_path
        
    end

    def new
        @entity_transaction = Entity.new
    end

    def create
        @entity_transaction = Entity.new(activity_params)
        @entity_transaction.author = current_user
        
        if @entity_transaction.save!
            flash[:notice] = "Transaction created successfully"
            redirect_to entities_path
        end
    end


    def activity_params
        params.require(:entity).permit(:name, :amount, category_ids: [])
      end
end
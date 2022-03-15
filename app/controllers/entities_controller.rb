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
        
        respond_to do |format|
        if @entity_transaction.save!
            p '==================='
            p @entity_transaction
            p '==================='
            format.html { redirect_to @entity_transaction.categories.first, notice: 'Transaction was successfully created.' }
        else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end


    def activity_params
        params.require(:entity).permit(:name, :amount, category_ids: [])
      end
end
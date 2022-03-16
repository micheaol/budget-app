require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/activities', type: :request do
  login_user

  describe 'GET /index' do
    it 'renders a successful response' do
      get categories_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_activity_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Activity' do
        expect do
          post activities_url,
               params: { activity: FactoryBot.attributes_for(:activity,
                                                             category_ids: [FactoryBot.create(:category).id]) }
        end.to change(Activity, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new activity' do
        expect do
          post activities_url, params: { activity: FactoryBot.attributes_for(:activity, name: nil) }
        end.to change(Activity, :count).by(0)
      end

      it "renders new page (i.e. to display the 'new' template)" do
        post activities_url, params: { activity: FactoryBot.attributes_for(:activity, name: nil) }
        expect(response).not_to be_successful
      end
    end
  end
end
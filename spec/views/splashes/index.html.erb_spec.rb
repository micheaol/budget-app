require 'rails_helper'

RSpec.describe 'splashes/index', type: :view do
  before(:each) do
    assign(:splashes, [
             Splash.create!,
             Splash.create!
           ])
  end

  it 'renders a list of splashes' do
    render
  end
end

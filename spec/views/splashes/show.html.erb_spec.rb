require 'rails_helper'

RSpec.describe 'splashes/show', type: :view do
  before(:each) do
    @splash = assign(:splash, Splash.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end

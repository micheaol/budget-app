require 'rails_helper'

RSpec.describe "splashes/edit", type: :view do
  before(:each) do
    @splash = assign(:splash, Splash.create!())
  end

  it "renders the edit splash form" do
    render

    assert_select "form[action=?][method=?]", splash_path(@splash), "post" do
    end
  end
end

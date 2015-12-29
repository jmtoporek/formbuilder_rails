require 'rails_helper'

RSpec.describe "configurators/index", type: :view do
  before(:each) do
    assign(:configurators, [
      Configurator.create!(
        :name => "TestConfigOne"
      ),
      Configurator.create!(
        :name => "Second Configurator"
      )
    ])
  end

  it "renders a list of configurators" do
    render
    assert_select "tr>td", :text => "TestConfigOne".to_s, :count => 1
    assert_select "tr>td", :text => "Second Configurator".to_s, :count => 1
  end
end

require 'rails_helper'

RSpec.describe "configurators/new", type: :view do
  before(:each) do
    assign(:configurator, Configurator.new(
      :name => "MyString"
    ))
  end

  it "renders new configurator form" do
    render

    assert_select "form[action=?][method=?]", configurators_path, "post" do

      assert_select "input#configurator_name[name=?]", "configurator[name]"
    end
  end
end

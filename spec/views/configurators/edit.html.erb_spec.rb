require 'rails_helper'

RSpec.describe "configurators/edit", type: :view do
  before(:each) do
    @configurator = assign(:configurator, Configurator.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit configurator form" do
    render

    assert_select "form[action=?][method=?]", configurator_path(@configurator), "post" do

      assert_select "input#configurator_name[name=?]", "configurator[name]"
    end
  end
end

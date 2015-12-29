require 'rails_helper'

RSpec.describe "configurators/show", type: :view do
  before(:each) do
    @configurator = assign(:configurator, Configurator.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

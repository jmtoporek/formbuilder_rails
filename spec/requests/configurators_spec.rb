require 'rails_helper'

RSpec.describe "Configurators", type: :request do
  describe "GET /configurators" do
    it "works! (now write some real specs)" do
      get configurators_path
      expect(response).to have_http_status(200)
    end
  end
end

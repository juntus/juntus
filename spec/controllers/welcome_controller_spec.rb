require 'spec_helper'

describe WelcomeController do
  render_views

  describe "GET 'quem_somos'" do
    it "returns http success" do
      get 'quem_somos'
      response.should be_success
    end
  end
end
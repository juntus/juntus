require 'spec_helper'

describe UsersController do
  describe :routing do
    it {
      get("/dashboard").should route_to(controller: "users", action: "dashboard")
    }
  end
end

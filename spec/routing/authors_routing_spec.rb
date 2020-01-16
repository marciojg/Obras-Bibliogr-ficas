# -*- encoding : utf-8 -*-
require "rails_helper"

RSpec.describe AuthorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/authors").to route_to("authors#index")
    end
  end
end

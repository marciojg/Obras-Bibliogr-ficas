# -*- encoding : utf-8 -*-
require "rails_helper"

RSpec.describe Api::V1::AuthorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/authors").to route_to({"format"=>:json, "controller"=>"api/v1/authors", "action"=>"index"})
    end
  end
end

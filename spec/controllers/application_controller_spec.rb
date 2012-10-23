# encoding: utf-8
require 'spec_helper'

describe ApplicationController do
  let(:user) { FactoryGirl.create(:user) }
  describe "#save_return_path" do
    before do
      request.stub!(:path).and_return("/this/path")
    end
    it "should save current path to return path" do
      expect {
        controller.send(:save_return_path)
      }.to change { session[:return_path] }.from(nil).to("/this/path")
    end
  end
end
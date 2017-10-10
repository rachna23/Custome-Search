require 'rails_helper'

 RSpec.describe CategoriesController, :type => :controller do
 	
 	it "should returns the success js response" do
      get :index, :format => 'js'
      response.status.should eq 200
      expect(response).to be_success
    end

 	it "should return the list of all history" do
      get :history
      response.status.should eq 200
      expect(response).to be_success
    end   

 	it "should find images if noun is present for history search" do
 		@category = FactoryGirl.create(:category)
      post :create,params: {"color"=>"pink"} , params: {"noun"=>"test"}, :format => 'js'
      response.status.should eq 200
      expect(response).to be_success
    end  

  it "should find images when category is selected" do
    @category = FactoryGirl.create(:category)
       post :create, params: { category: { id: @category.id } }, :format => 'js'
      response.status.should eq 200
      expect(response).to be_success
    end  

 end	





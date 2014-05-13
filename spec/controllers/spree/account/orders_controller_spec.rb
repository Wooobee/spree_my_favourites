require 'spec_helper'

describe Spree::Account::OrdersController do

  describe "index" do

    let(:complete_orders) { double(Array) }
    let(:user_orders) { double(Array, complete: complete_orders) }
    let(:user) { mock_model Spree::User, :last_incomplete_spree_order => nil, :has_spree_role? => true, :spree_api_key => 'fake', :orders => user_orders }

    before :each do
      controller.stub :spree_current_user => user
      controller.stub :check_authorization
    end

    it 'should render current users orders' do
      spree_get :index
      assigns(:user).should == user
      assigns(:orders).should == complete_orders
    end

    it 'should redirect to login if user is not logged in' do
      controller.stub(:spree_current_user).and_return nil
      spree_get :index
      response.status.should == 401
    end

  end

end

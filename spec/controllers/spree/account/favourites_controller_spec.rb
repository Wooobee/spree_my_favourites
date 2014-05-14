require 'spec_helper'

describe Spree::Account::FavouritesController do

  describe "index" do

    let(:complete_orders) { double(Array) }
    let(:user_orders) { double(Array, complete: complete_orders) }
    let(:user) { mock_model Spree::User, :last_incomplete_spree_order => nil, :has_spree_role? => true, :spree_api_key => 'fake', :orders => user_orders }

    before :each do
      controller.stub :spree_current_user => user
      controller.stub :check_authorization
    end

    it 'should redirect to login if user is not logged in' do
      controller.stub(:spree_current_user).and_return nil
      spree_get :index
      response.should redirect_to(spree.login_path)
    end

  end
end

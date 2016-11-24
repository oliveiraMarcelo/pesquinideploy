require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do 
	describe   "GET" do 
		describe '#new' do
			it "should work" do 
				get :new
				expect(response).to have_http_status(:success)
			end
		end
	end
end
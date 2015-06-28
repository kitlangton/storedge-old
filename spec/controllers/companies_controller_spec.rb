require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do
  context "logged in" do
    it "users can see their own company page" do
      user = create(:user)
      sign_in user

      get :show, id: user.company
      expect(response).to render_template :show
    end

    it "prevents users from seeing another company" do
      user = create(:user)
      other_company = create(:company)
      sign_in user

      get :show, id: other_company
      expect(response).to redirect_to root_path
    end
  end
end

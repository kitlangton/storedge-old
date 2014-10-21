require 'rails_helper'

feature "User adds a product to their cart" do


  scenario "They see it in their cart" do
    user = create(:user)
    visit root_path


  end
end

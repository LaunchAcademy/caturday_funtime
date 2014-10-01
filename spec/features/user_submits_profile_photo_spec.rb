require 'rails_helper'

feature 'user submits profile photo' do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  let(:sample_photo) do
    Rails.root.join("spec/data/cat-milk.jpg")
  end

  scenario 'user adds a profile photo to an existing account then views the photo on their account' do
    visit 'users/edit'

    fill_in "Current password", with: "12345678"
    attach_file "user_profile_photo", sample_photo
    # click_button "Choose file"
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")

    visit user_path(@user)

    expect(page).to have_css("img[alt=\"Cat milk\"]")

  end

end

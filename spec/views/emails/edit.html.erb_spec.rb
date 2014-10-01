require 'rails_helper'

RSpec.describe "emails/edit", :type => :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :new_review => "MyString"
    ))
  end

  it "renders the edit email form" do
    render

    assert_select "form[action=?][method=?]", email_path(@email), "post" do

      assert_select "input#email_new_review[name=?]", "email[new_review]"
    end
  end
end

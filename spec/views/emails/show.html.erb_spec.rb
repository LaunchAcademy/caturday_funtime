require 'rails_helper'

RSpec.describe "emails/show", :type => :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :new_review => "New Review"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New Review/)
  end
end

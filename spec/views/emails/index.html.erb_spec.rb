require 'rails_helper'

RSpec.describe "emails/index", :type => :view do
  before(:each) do
    assign(:emails, [
      Email.create!(
        :new_review => "New Review"
      ),
      Email.create!(
        :new_review => "New Review"
      )
    ])
  end

  it "renders a list of emails" do
    render
    assert_select "tr>td", :text => "New Review".to_s, :count => 2
  end
end

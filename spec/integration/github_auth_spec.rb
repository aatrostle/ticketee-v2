require 'spec_helper'

feature "GitHub Auth" do
  before do
    OmniAuth.config.mock_auth[:github] = {
      "extra" => {
        "raw_info" => {
          "id" => '12345',
          "email" => 'githubber@example.com',
          "login" => 'githubber',
          "name" => "A GitHubber"
        }
      }
    }
  end

  it "can sign in within GitHub" do
    visit '/'
    click_link "sign_in_with_github"
    page.should have_content "Signed in with GitHub successfully."
    page.should have_content "Signed in as A GitHubber"
  end
end

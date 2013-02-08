require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /pages/home" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end

  it "should have a Home page at '/'" do
    get root_path
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get contact_path
    response.should have_selector('title', :content => "Contact")
  end

  it "should have a About page at '/about'" do
    get about_path
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    get help_path
    response.should have_selector('title', :content => "Help")
  end
end
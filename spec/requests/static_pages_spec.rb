require 'spec_helper'

describe "StaticPages" do
  let(:tt) {'Sample App | ' }
  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
      visit root_path
      page.should have_selector('title',
                        :text => "Sample App")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/help'
      page.should have_selector('title',
                        :text => tt+"Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/about'
      page.should have_selector('title',
                    :text => tt+"About Us")
    end
  end
end

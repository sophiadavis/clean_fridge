require 'spec_helper'

describe "StaticPages" do

	shared_examples_for "all static pages" do
		it { should have_selector('h1', 		text:heading) }
		it { should have_selector('title', 		text: full_title(page_title) }
	end

		describe "Home Page" do
			it "should have content 'CleanFridge'" do
			visit '/static_pages/home'
			page.should have_content("CleanFridge")
		end
	end
end

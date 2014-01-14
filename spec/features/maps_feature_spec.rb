require 'spec_helper'


# HAVING TROUBLE GETTING CAPYBARA TO FIND FIELDS

describe MapsController do 
  describe "starting on the new map page do" do
    before do
      visit new_map_path
    end
    it "creates a new map" do
      fill_in :title, with: "favorites"
      fill_in :city, with: "NYC"
      click_button "submit"
      current_path.should == maps_path
      page.should have_content
    end
  end

  describe "when visiting a map's edit page" do
    before do
      @user = User.create(email: 'bob@example.com', password: 'password')
      login_as(@user)
      @map = Map.create(user_id: @user.id)
      visit edit_map_path(@map)
    end
    describe "when we fill in the place form" do
      before do
        
        current_path.should == edit_map_path(@map)
        fill_in "place_title", with: "random place"
        click_button "submit"
      end
      it "creates a new place and adds it to the map" do
        page.should have_content("random place")
      end
    end
  end

end
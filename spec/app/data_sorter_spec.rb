require 'spec_helper'
RSpec.describe Services::DataSorter do

	describe ".sort the data by order" do
		it "should sort the provided data " do
			data = [{"birthdate"=>"1986-05-29", "city"=>"Atlanta", "first_name"=>"Mckayla", "last_name"=>""}, {"birthdate"=>"1947-05-04", "city"=>"New York City", "first_name"=>"Elliot", "last_name"=>""},{"city"=>"Los Angeles", "birthdate"=>"30-4-1974", "last_name"=>"Nolan", "first_name"=>"Rhiannon"}, {"city"=>"NYC", "birthdate"=>"5-1-1962", "last_name"=>"Bruen", "first_name"=>"Rigoberto"}]
			expected_response =  ["Elliot, New York City, 5/4/1947", "Mckayla, Atlanta, 5/29/1986", "Rhiannon, Los Angeles, 4/30/1974", "Rigoberto, NYC, 1/5/1962"]
    	expect(Services::DataSorter.new().sort(data, nil)).to match_array(expected_response)
		end

		it "should sort the provided data " do
			data = [{"birthdate"=>"1986-05-29", "city"=>"Atlanta", "first_name"=>"Mckayla", "last_name"=>""}, {"birthdate"=>"1947-05-04", "city"=>"New York City", "first_name"=>"Elliot", "last_name"=>""},{"city"=>"Los Angeles", "birthdate"=>"30-4-1974", "last_name"=>"Nolan", "first_name"=>"Rhiannon"}, {"city"=>"NYC", "birthdate"=>"5-1-1962", "last_name"=>"Bruen", "first_name"=>"Rigoberto"}]
			expected_response =  ["Mckayla, Atlanta, 5/29/1986", "Rhiannon, Los Angeles, 4/30/1974", "Elliot, New York City, 5/4/1947", "Rigoberto, NYC, 1/5/1962"]
    	expect(Services::DataSorter.new().sort(data, "city")).to match_array(expected_response)
		end
	end
end

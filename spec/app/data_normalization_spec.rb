require 'spec_helper'
RSpec.describe Services::DataNormalization do

	describe ".split delimiters" do
		it "should split the provided file by delimiter $" do
			file = File.read('spec/fixtures/people_by_dollar.txt')
			expected_response = [{"city"=>"LA", "birthdate"=>"30-4-1974", "last_name"=>"Nolan", "first_name"=>"Rhiannon"}, {"city"=>"NYC", "birthdate"=>"5-1-1962", "last_name"=>"Bruen", "first_name"=>"Rigoberto"}]
    	expect(Services::DataNormalization.new().get_data(file)).to match_array(expected_response)
		end

		it "should split the provided file by delimiter %" do
			file = File.read('spec/fixtures/people_by_percent.txt')
			expected_response =  [{"birthdate"=>"1986-05-29", "city"=>"Atlanta", "first_name"=>"Mckayla", "last_name"=>""}, {"birthdate"=>"1947-05-04", "city"=>"New York City", "first_name"=>"Elliot", "last_name"=>""}]
			expect(Services::DataNormalization.new().get_data(file)).to match_array(expected_response)
		end
	end
end

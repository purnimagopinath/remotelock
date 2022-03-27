require_relative 'data_normalization'
require_relative 'data_sorter'
class PeopleController

  def initialize(params)
    @params = params
  end

  def normalize
    sort_order = params[:order]
    params.delete(:order)
    Services::DataSorter.new().sort(parse_and_format_input.flatten, sort_order)
  end

  private

  def parse_and_format_input
    contents = []
    params.map{|format, file| contents << Services::DataNormalization.new().get_data(file) if format.match?(PatternConstants::INPUT_PATTERN)}
    contents
  end

  attr_reader :params
end

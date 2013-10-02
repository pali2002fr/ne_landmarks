# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Landscape < ActiveRecord::Base; end

require 'csv-mapper'
include CsvMapper
file_name = File.expand_path(File.join(File.dirname(__FILE__),'ne_landmarks.csv'))
        results = CsvMapper.import(file_name) do
        map_to Landscape
        after_row lambda{|row, landscape| landscape.save }  # Call this lambda and save each record after it's parsed.
        start_at_row 2
        [latitude, longitude, name, details]
end

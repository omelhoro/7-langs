module  ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end
	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end
	module InstanceMethods
		def each(&block)
			@csv_contents.each {|e|
				block.call e}
		end
		def read
			@csv_contents=[]
			filename= "rubycsv.txt"
			file= File.new(filename)
			@headers=file.gets.chomp.split(', ')
			file.each do |row|
				@csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
			end
		end
		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
	end
end
class CsvRow
	attr_accessor :data
	def initialize(headers,data)	
		@data=Hash[headers.zip(data)]
	end
	def method_missing name, *args
		@data[name.to_s]
	end
end
class RubyCsv
	include ActsAsCsv
	acts_as_csv
end
m=RubyCsv.new
m.csv_contents[0].one == m.csv_contents[0].data["one"]
puts m.each {|r| puts r.one}

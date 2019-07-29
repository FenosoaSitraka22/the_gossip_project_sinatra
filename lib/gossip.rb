
require 'pry'
require 'csv'
class Gossip
 attr_accessor :author, :content

    def initialize(a,c)
    	@author = a
    	@content = c
    end

	def save
	  	CSV.open("./db/gossip.csv", "ab") do |csv|
	    	csv << [@author, @content]
	  	end
	end

	def self.all
  		all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
 	    	all_gossips << Gossip.new(csv_line[0], csv_line[1])
 		end
 	  return all_gossips
	end

	def self.find(wanted)
		i = 1
		Gossip.all.each do |c|
			if (wanted.to_i == i)
				return c
				break
			end
			i += 1
		end
		
	end

end 

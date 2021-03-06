require 'csv'

class Gossip
    attr_accessor :author, :content
    @@all_gossips = []

    def initialize(author, content)
        @author = author
        @content = content
    end
    
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end
    end

    def self.all
        
        CSV.read("./db/gossip.csv").each do |csv_line|
          @@all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return @@all_gossips
    end
    
    def self.find(id)
        ida = id.to_i
        self.all[ida]
    end


end
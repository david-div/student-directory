require 'csv'

def prints_self
    CSV.foreach(__FILE__) do |row|
    puts row
    end
end

prints_self


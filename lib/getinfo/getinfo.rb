require 'rubygems'
require 'json'

class Getinfo
  def initialize
    file = open("lib/getinfo/course.json")
    json = file.read
    parsed =  JSON.parse(json)
    # (1..12).each do |i|
    #   puts parsed[i]["code"]
    #   puts parsed[i]["name"]
    # end
    parsed.each do |course|
      code = course["code"]
      name = course["name"]
      Course.create(code: code, name: name)
    end
  end
end

# file = open(Dir.pwd + "/Course_Catalog/lib/getinfo/course.json")
# json = file.read
# parsed =  JSON.parse(json)
# (1..12).each do |i|
#   puts parsed[i]["code"]
#   puts parsed[i]["name"]
# end

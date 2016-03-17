require 'rubygems'
require 'json'

class Getinfo
  def initialize
    file_course = open("lib/getinfo/course.json")
    json_course = file_course.read
    parsed_course =  JSON.parse(json)
    parsed_course.each do |course|
      code = course["code"]
      name = course["name"]
      Course.create(code: code, name: name)
    end

    file_instructor = open("lib/getinfo/course.json")
    json_instructor = file_instructor.read
    parsed_instructor =  JSON.parse(json)
    parsed_instructor.each do |instructor|
      first = instructor["first"]
      last = instructor["last"]
      type = instructor["type"]
      Instructor.create(first: first, last: last, type: type)
    end

    # file_course = open("lib/getinfo/course.json")
    # json_course = file.read
    # parsed_course =  JSON.parse(json)
    # parsed_course.each do |course|
    #   code = course["code"]
    #   name = course["name"]
    #   Course.create(code: code, name: name)
    # end

  end
end

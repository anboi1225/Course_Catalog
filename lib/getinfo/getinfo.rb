require 'rubygems'
require 'json'

class Getinfo
  def initialize
    file_course = open("lib/getinfo/course.json")
    json_course = file_course.read
    parsed_course =  JSON.parse(json_course)
    parsed_course.each do |course|
      code = course["code"]
      name = course["name"]
      Course.create(code: code, name: name)
    end

    file_instructor = open("lib/getinfo/instructor.json")
    json_instructor = file_instructor.read
    parsed_instructor =  JSON.parse(json_instructor)
    parsed_instructor.each do |instructor|
      first = instructor["first"]
      last = instructor["last"]
      iid = instructor["id"]
      Instructor.create(first: first, last: last, iid: iid)
    end

    file_subject = open("lib/getinfo/subject.json")
    json_subject = file_subject.read
    parsed_subject =  JSON.parse(json_subject)
    parsed_subject.each do |subject|
      sid = subject["id"]
      name = subject["name"]
      Subject.create(sid: sid, name: name)
    end

  end
end

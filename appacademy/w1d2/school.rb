class Student
  attr_reader :courses, :firstname, :lastname

  def initialize(firstname,lastname)
    @firstname = firstname
    @lastname = lastname
    @courses = []
  end

  def name
    "#{@firstname} #{@lastname}"
  end

  def enroll(course)
    unless courses.include?(course)
      @courses << course
      course.students << self
    end
  end

  def course_load
    # #credit_list = Hash.new(0)
    # self.courses.each do |course|
    #   credit_list[course.department] += course.credits
    # end
    # credit_list
    Hash.new(0).tap do |load|
      @courses.each do |course|
        load[course.department] += course.credits
      end
    end
  end
end

class Courses
  attr_reader :students, :department, :credits

  def initialize(course, department, credits)
    @course = course
    @department = department
    @credits = credits
    @students = []
  end

  def add_student(student)
    student.enroll(self)
  end
end

carl = Student.new("carl", "kim")
david = Student.new("dave", "carter")
roman_history = Courses.new("roman history", "history", 4)
comp_sci = Courses.new("CS1", "science", 3)
chemistry = Courses.new("chemistry", "science", 4)
carl.enroll(comp_sci)
carl.enroll(chemistry)
carl.enroll(roman_history)
p carl.course_load
p comp_sci.students

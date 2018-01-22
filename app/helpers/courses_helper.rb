module CoursesHelper
  def course_params
    {
      1 => 'TOEIC',
      2 => 'Buisiness',
      3 => 'Toefl'
    }
  end

  def select_course
    course_params.invert
  end
  
  def course_name(name)
    course_params[name]
  end
end

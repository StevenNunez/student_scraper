class Student
  attr_reader :name, :tagline, :bio, :detail_page, :image_url
  def self.new_from_collection(collection)
    collection.map {|student| self.new(student)}
  end

  def initialize(student_hash)
    student_hash.each do |property, value|
      instance_variable = "@#{property}"
      instance_variable_set(instance_variable, value)
    end
  end
end

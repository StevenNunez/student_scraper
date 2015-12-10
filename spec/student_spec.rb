describe Student do
  let(:lisa) do
    {
      :name=>"Lisa Jeon",
      :tagline=>"“lik-a, lik-a, lik-a, lik-a, lik-a, lik-a”",
      :bio=> "Lisa grew up in upstate NY, went to college in Boston for graphic design and worked in radio and advertising. In her spare time she loves crafting and traveling.",
      :detail_page=>"students/lisa_jeon.html",
      :image_url=>"img/students/lisa_jeon_profile.png"
    }
  end

  let(:kristy) do
    {
      :name=>"Kristy Jordan",
      :tagline=>"\"This is my boomstick!\"",
      :bio=> "I moved to New York 8 years ago to attend NYU’s film school.  After film school, I started working at Apple and have been at the Genius Bar ever since. I enjoy making candles and watching horror movies.  I also love traveling and have hiked part of the Himalayas.",
      :detail_page=>"students/kristy_jordan.html",
      :image_url=>"img/students/kristy_jordan_index_photo.png"
    }
  end
  it "initializes with a hash of student data" do
    student = Student.new(lisa)
    expect(student.name).to eq("Lisa Jeon")
    expect(student.tagline).to eq("“lik-a, lik-a, lik-a, lik-a, lik-a, lik-a”")
    expect(student.bio).to eq("Lisa grew up in upstate NY, went to college in Boston for graphic design and worked in radio and advertising. In her spare time she loves crafting and traveling.")
    expect(student.detail_page).to eq("students/lisa_jeon.html")
    expect(student.image_url).to eq("img/students/lisa_jeon_profile.png")
  end

  it "can create student objects from an array of hashes" do
    students = [lisa, kristy]
    student_objects = Student.new_from_collection(students)
    student = student_objects.first

    expect(student.name).to eq("Lisa Jeon")
    expect(student.tagline).to eq("“lik-a, lik-a, lik-a, lik-a, lik-a, lik-a”")
    expect(student.bio).to eq("Lisa grew up in upstate NY, went to college in Boston for graphic design and worked in radio and advertising. In her spare time she loves crafting and traveling.")
    expect(student.detail_page).to eq("students/lisa_jeon.html")
    expect(student.image_url).to eq("img/students/lisa_jeon_profile.png")
  end
end

describe Scraper do
  context "#scrape_index" do
    it "finds all users on the home page" do
      url = "http://learn-co-students.github.io/deploy-on-day-1-web-1115/"
      scraper = Scraper.new(url)
      students = nil

      VCR.use_cassette("student_index") do
        students = scraper.scrape_index
      end

      expect(students.count).to eq(29)
    end

    it "returns a hash respresenting the students" do
      url = "http://learn-co-students.github.io/deploy-on-day-1-web-1115/"
      scraper = Scraper.new(url)
      students = nil
      VCR.use_cassette("student_index") do
        students = scraper.scrape_index
      end

      student = students.first
      expect(student[:name]).to eq("Lisa Jeon")
      expect(student[:tagline]).to eq("“lik-a, lik-a, lik-a, lik-a, lik-a, lik-a”")
      expect(student[:bio]).to eq("Lisa grew up in upstate NY, went to college in Boston for graphic design and worked in radio and advertising. In her spare time she loves crafting and traveling.")
      expect(student[:detail_page]).to eq("students/lisa_jeon.html")
      expect(student[:image_url]).to eq("img/students/lisa_jeon_profile.png")
    end
  end
end

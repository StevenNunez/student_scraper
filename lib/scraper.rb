require 'rest-client'
require 'nokogiri'
require 'pry'
class Scraper
  attr_reader :url
  def initialize(url)
    @url = url
  end

  def scrape_index
    page = read_page(url)
    parsed = parse_page(page)
    student_nodes = find_students(parsed)
    convert_students_to_hash(student_nodes)
  end

  private
  def read_page(url)
    RestClient.get(url)
  end

  def parse_page(page)
    Nokogiri::HTML(page)
  end

  def find_students(parsed_page)
    parsed_page.css("li.home-blog-post")
  end

  def convert_students_to_hash(student_nodes)
    student_nodes.map do |student|
      convert_student_to_hash(student)
    end
  end

  def convert_student_to_hash(student_node)
    name = student_node.css('.big-comment a').text
    tagline = student_node.css(".home-blog-post-meta").text
    bio = student_node.css('.excerpt p').text
    detail_page = student_node.css('.blog-thumb a').attr("href").value
    image_url = student_node.css('.blog-thumb img').attr("src").value

    {
      name: name,
      tagline: tagline,
      bio: bio,
      detail_page: detail_page,
      image_url: image_url
    }
  end
end

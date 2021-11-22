require 'kimurai'

class CategorySpider < Kimurai::Base
    @name = 'categories_spider'

  
    def self.process(url)
      puts "process"
      @start_urls = [url]
      self.crawl!
    end
  
    def parse(response, url:, data: {})

        response.xpath("//div[@class='shop-srp-listings__listing-container']").each do |vehicle|
        item = {}
  
        item[:title]      = vehicle.css('h2.Typographystyles__TypographyStyled-gtxex0-0 hUMSUm')&.text&.squish
        item[:section_a]      = vehicle.css('section.PaperStyle__Section-zrnoqb-1 cKlCkw')&.text&.squish&.delete('^0-9').to_i
        item[:section_b] = vehicle.css('div.HomePopularItemsstyles__PopularItemTitleWrapper-tuaf59-2 bmetSw')&.text&.squish
  
        Vehicle.where(item).first_or_create
      end
    end

end
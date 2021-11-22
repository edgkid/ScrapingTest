class CategoriesController < ApplicationController


    def index

        @categories = Category.all
        render :index

    end

    def scraper
    
        puts "buscando scraper"

        url = 'https://www.letgo.com/es-es'
        
        response = CategorySpide.process(url)

        puts response

        if response[:status] == :completed && response[:error].nil?
            flash.now[:notice] = "Successfully scraped url"
            puts "Successfully scraped url"
        else
            flash.now[:alert] = response[:error]
            puts "Error"
        end
        rescue StandardError => e
        flash.now[:alert] = "Error: #{e}"

        redirect_to categories_letgo_path
    end

end

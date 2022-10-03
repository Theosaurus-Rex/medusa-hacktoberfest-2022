require 'httparty'
# FIXME: products page only accesses the generated data files on re-render
module JekyllMedusa
  class GetMedusaData < Jekyll::Generator
    def generate(site)
      # only run on build (not re-render in local development)
      @render_count = 1 if (!defined?@render_count)
      @render_count > 1 ? Jekyll.logger.info('already fetched data') && return : @render_count += 1

      config = site.config['jekyll-medusa'] || {}

      for endpoint in config['medusaEndpoints']['store']['get']
        url = config['medusaApiUrl'] + "/store/" + endpoint

        response = HTTParty.get(url)

        if response.code == 200
          File.open("_data/generated/#{endpoint}.json", 'w') do |f|
            f.write(response.body)
          end
        else
          raise "Error retriving #{endpoint}: #{response.code} #{response.message}"
        end
      end

      Jekyll.logger.info('Data fetched successfully.')
    end
  end
end

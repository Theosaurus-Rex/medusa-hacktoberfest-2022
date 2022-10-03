require 'httparty'

Jekyll::Hooks.register :site, :after_init do |site, payload|
  def get_data(site)
    config = site.config['jekyll-medusa'] || {}

    # loop through endpoints and get data
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

      Jekyll.logger.info("✅ #{endpoint} data fetched successfully")
    end

  end

  get_data(site)
end

require 'tempfile'
module JekyllMedusa
  class Generator < Jekyll::Generator
    safe true

    def generate(site)
      # use webpack to package a configured version of medusa-js client
      config = site.config['jekyll-medusa'] || {}

      if !config['medusaApiUrl']
        raise "jekyll-medusa: medusaApiUrl is required"
      end

      config['maxRetries'] ||= 3

      helperFile = Tempfile.new('medusajs', '.')
      helperFile.write(
"const Medusa = require('@medusajs/medusa-js').default

window.medusaAPI = new Medusa({
  baseUrl: \"#{config['medusaApiUrl']}\",
  maxRetries: #{config['maxRetries']}
})
")
      helperFile.close
      puts(`npm exec -c "webpack -o ./_site/assets/js #{helperFile.path} --mode production"`)
      helperFile.unlink

      # TODO: Use a webpack config to avoid this rename (or better alternative to webpack)
      File.rename("_site/assets/js/main.js", "_site/assets/js/medusajs.js")
      site.keep_files << 'assets/js/medusajs.js'
    end
  end
end

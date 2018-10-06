module Jekyll
  class DataPage < Page
    def initialize(site, base, config, data)
      @site = site
      @base = base
      @name = 'index.html'
      @dir = config['permalink']

      layout = parse_layout_filename(config['layout'])

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), layout)
      self.data['data'] = data
      self.data['permalink'] = config['permalink']
    end

    def url_placeholders
      data = self.data['data'].clone
      data.each { |key, value| data[key] = value.to_s }
      {
        :path => @dir,
        :basename => basename,
        :output_ext => output_ext
      }.merge(data)
    end

    private

    def parse_layout_filename(layout)
      "#{layout}.html"
    end
  end

  class DataPageGenerator < Generator
    safe true

    def generate(site)
      if site.config.key? 'data_pages'
        site.config['data_pages'].each do |config|
          data = site.data[config['dataset']]

          if data.kind_of?(Hash)
            data = data.values
          end

          data.each_with_index do |obj|
            excluded = false

            config['exclude'].each do |exc_hash|
              exc_key = exc_hash[0]
              exc_values = exc_hash[1]

              if exc_values.include? obj[exc_key]
                excluded = true
              end
            end

            unless excluded
              site.pages << DataPage.new(site, site.source, config, obj)
            end
          end
        end
      end
    end
  end
end

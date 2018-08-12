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
      {
        :path => @dir,
        :basename => basename,
        :output_ext => output_ext
      }.merge(self.data['data'])
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
        site.config['data_pages'].each do |key, config|
          data = site.data[key]
          data.each_with_index do |value, key|
            site.pages << DataPage.new(site, site.source, config, value)
          end
        end
      end
    end
  end
end

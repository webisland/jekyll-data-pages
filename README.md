# jekyll-data-pages

This [Jekyll](https://jekyllrb.com) plugin generates

## Instalation

Add the `jekyll-data-pages` gem to the `:jekyll-plugins` group in your `Gemfile`:
```ruby
group :jekyll_plugins do
  gem 'jekyll-data-pages', 'https://github.com/webisland/jekyll-data-pages'
end
```

## Usage

1. Put a data file in [Jekyll data folder](https://jekyllrb.com/docs/datafiles/#the-data-folder).
Example `list.csv`:
```csv
id,title,description
1,"First item","First item description"
2,"Second item","Second item description"
```
2. Put the configuration in your `_config.yml`.
```yaml
data_collections:
  list:
    permalink: /list/:id/
    layout: list_item
```
3. Create a layout in `_layouts/`. The page data properties are with `page.data` hash
Example `list_item`
```html
<div>
  <div>{{ page.data.id }}</div>
  <div>{{ page.data.title }}</div>
  <div>{{ page.data.description }}</div>
</div>
```

## Versioning

This project uses [semantic versioning](http://semver.org/).

## License

This software is licensed under [the MIT License](LICENSE).

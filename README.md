# jekyll-data-pages

This [Jekyll](https://jekyllrb.com) plugin generates a page for each row of the specified data files.

## Instalation

Add the `jekyll-data-pages` gem to the `:jekyll-plugins` group in your `Gemfile`:
```ruby
group :jekyll_plugins do
  gem 'jekyll-data-pages', 'https://github.com/webisland/jekyll-data-pages'
end
```

## Usage

1. Put a data file in [Jekyll data folder](https://jekyllrb.com/docs/datafiles/#the-data-folder).<br/>
Example `list.csv`:
```csv
id,title,description
1,"First item","First item description"
2,"Second item","Second item description"
```
2. Specify data files to generate pages in `_config.yml`.
```yaml
data_collections:
  list:
    permalink: /list/:id/
    layout: list_item
```
3. Create a layout in `_layouts/`. The page data properties are associated with `page.data` hash.<br/>
Example `_layouts/list_item.html`:
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

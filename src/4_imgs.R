#Loading the Kanye images from getty images
'https://www.gettyimages.com/photos/taylor-swift?family=editorial&phrase=taylor%20swift&sort=mostpopular' %>%
  read_html %>%
  html_nodes(
    'body > div.content_wrapper > section > div > main > section > div.search-content__gallery-pager-wrapper > div > div > div > div.search-content__gallery-assets > div > article > a > figure > img'
  ) %>%
  html_attr('src') -> ts_imgs

#Loading the Kanye images from getty images
'https://www.gettyimages.com/photos/taylor-swift?family=editorial&phrase=taylor%20swift&sort=mostpopular' %>%
  read_html %>%
  html_nodes(
    '.gallery-mosaic-asset__thumb'
  ) %>%
  html_attr('src') -> ts_imgs

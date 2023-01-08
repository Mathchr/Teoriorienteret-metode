link = "https://en.wikipedia.org/wiki/FC_Bayern_Munich"
page = read_html(link)

Honours = page %>% html_nodes(".plainrowheaders a") %>% html_text()
Players = page %>% html_nodes("table:nth-child(151) a , #Players , .plainrowheaders a") %>% html_text()

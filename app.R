if (interactive() & sum(grepl("tSwift",getwd()))==0)
  setwd("tSwift")

source("setup.R",.GlobalEnv)

shinyApp(
  ui = ui(),
  server = function(input, output, session) {
    #First picture and quote
    ts_pic <- reactiveVal(value = random_img())
    ts_quote <- reactiveVal(value = random_quote())
    
    #Determine if the application has been pulled for refreshing
    observeEvent(input$ptr,
                 {
                   ts_pic(random_img())
                   ts_quote(random_quote())
                 })
    #Output of the card showing the yeezy quote and the picture
    output[['tswift']] <- renderUI({
      f7Card(
        id = "main",
        title = h2("Taylor Swift"),
        tags$img(src = ts_pic(), style = "display: block; margin-left: auto; margin-right: auto; max-width:100%; width:70%; height:auto; border-radius:3%;"),
        br(),
        tags$h2(tags$blockquote(ts_quote()), style = "display: block; margin-left: auto; margin-right: auto; text-align:center;")
      )
    })
    # send the theme to javascript
    observe({
      session$sendCustomMessage(type = "ui-tweak",
                                message = list(os = input$theme, skin = input$color))
    })
    
  }
)

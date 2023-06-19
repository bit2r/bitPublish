library(hexSticker)
library(showtext)

## https://pixabay.com/illustrations/book-reading-read-coffee-knowledge-4155805/
chatGPT_logo <- "inst/book-4155805_1280.jpeg"

font_add_google("Nanum Pen Script", "pen")

sticker(chatGPT_logo, package = "비트퍼블리시", p_family = "pen",
        p_size = 25, p_y = 1.5, p_color = "#FFFFFF",
        s_x = 0.99, s_y = 0.8, s_width = 0.6, s_height = 0.6,
        h_size = 1.5, h_color = "#FF9801", h_fill = "#4F95CD",
        filename = "img/bitPublish_logo.png")

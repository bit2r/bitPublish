##==============================================================================
## R graphics 한글 폰트 적용을 위한 작업
##==============================================================================
if(!require("Cairo")){
  install.packages("Cairo")
  library("Cairo")
}

if(!require("here")){
  install.packages("here")
  library("here")
}

if(!require("tidyverse")){
  install.packages("tidyverse")
  library("tidyverse")
}

if(!require("gt")){
  install.packages("gt")
  library("gt")
}

if(!require("hrbrthemes")){
  install.packages("hrbrthemes")
  library("hrbrthemes")
}

if(!require("ragg")){
  install.packages("ragg")
  library("ragg")
}

# 한글 폰트
sysfonts::font_add("NanumSquare", 
         regular = here::here("_extensions", "bit2r", "bitPublish", "fonts", 
                              "NanumSquare", "NanumSquareR.otf"), 
         bold = here::here("_extensions", "bit2r", "bitPublish", "fonts", 
                           "NanumSquare", "NanumSquareB.otf"))

# 영문폰트
sysfonts::font_add("Nimbus Sans L",
         regular = here("_extensions", "bit2r", "bitPublish", "fonts", "Nimbus Sans L", 
                        "NimbusSanL-Reg.otf"),     
         bold = here("_extensions", "bit2r", "bitPublish", "fonts", "Nimbus Sans L", 
                     "NimbusSanL-Bol.otf"),     
         italic = here("_extensions", "bit2r", "bitPublish", "fonts", "Nimbus Sans L", 
                       "NimbusSanL-RegIta.otf"),     
         bolditalic = here("_extensions", "bit2r", "bitPublish", "fonts", "Nimbus Sans L", 
                           "NimbusSanL-BolIta.otf"))


## 청크 옵션에서 폰트를 선택할 수 있도록 후크 추가    
knitr::knit_hooks$set(
  nanum = function(before, options, envir)
    if (before) par(family = "NanumSquare"),
  nimbus = function(before, options, envir)
    if (before) par(family = "Nimbus Sans L")
)

knitr::opts_chunk$set(
  message = FALSE, warning = FALSE,
  dev = "ragg_png", dpi = 300, fig.pos = "htb!", 
  fig.align = "center")

## ggplot2 테마 설정
old_theme <- theme_set(theme_grey())
theme_set(hrbrthemes::theme_ipsum(base_family = "NanumSquare"))

## 청크로 R 시각화를 위한 디렉토리 생성
if (!dir.exists("figure")) {
  dir.create("figure")
}

##==============================================================================
## table의 cross-reference 적용을 위해서
##==============================================================================
## https://github.com/rstudio/gt/issues/818 참고로 작성
as_latex_with_caption <- function(gt, label, caption) {
  gt <- gt::as_latex(gt)
  
  caption <- paste0(
    "\\caption{\\label{", label, "}", caption, "}")
  
  latex <- strsplit(gt[1], split = "\n")[[1]]
  latex <- c(latex[-length(latex)], caption, latex[length(latex)])
  latex <- paste(latex, collapse = "\n")
  gt[1] <- latex
  
  gt
}

##==============================================================================
## table의 cross-reference 적용을 위해서
##==============================================================================
table_with_caption <- function(tab, label, digits = NULL, big.mark = NULL) {
  if (knitr::is_latex_output()) {
    caption_lab <- paste0(
      "\\caption{\\label{", label, "}\n")
    
    align <- paste(ifelse(sapply(tab, is.numeric), "r", "l"), collapse = "")
    
    tab2 <- tab                                          
    factor_columns <- sapply(tab2, is.factor)  
    numeric_columns <- sapply(tab2, is.numeric)  
    
    change_format <- function(x, digits, big.mark) {
      if (!is.null(digits) & !is.null(big.mark)) {
        x <- format(x, digits = digits, big.mark = big.mark)
      } else if (!is.null(digits) & is.null(big.mark)) {
        x <- format(x, digits = digits)
      } else if (is.null(digits) & !is.null(big.mark)) {
        x <- format(x, big.mark = big.mark)
      } else {
        x <- x
      }
      
      x
    }
    
    tab2[factor_columns] <- lapply(tab2[factor_columns], as.character)
    tab2[numeric_columns] <- lapply(tab2[numeric_columns], change_format,
                                    digits = digits, big.mark = big.mark)
    
    contents <- NULL
    
    for (i in seq(NROW(tab2))) {
      contents <- paste0(contents, paste(paste(tab2[i, ], collapse = " & "), "\\\\\n"))
    }
    
    str <- ""
    str <- paste0(str, "")
    # str <- paste0(str, "\\begin{table}[htb!]\n")
    str <- paste0(str, "\\begin{longtable}{", align, "}\n")
    str <- paste0(str, "\\toprule\\noalign{}\n")
    str <- paste0(str, paste(names(tab), collapse = " & "), "\\\\\n")
    str <- paste0(str, "\\midrule\\noalign{}\n")
    str <- paste0(str, contents)
    str <- paste0(str, "\\bottomrule\\noalign{}\n")
    str <- paste0(str, caption_lab)      
    str <- paste0(str, "\\end{longtable}\n")
    # str <- paste0(str, "\\end{table}\n")    
    
    cat(str)
    
    # knitr::kable(tab, format = "latex", label = label, caption = caption) |>
    #   cat()
  }
  
  if (knitr::is_html_output()) {
    knitr::kable(tab)
  }  
}


##==============================================================================
## information, caution 블록의 정의
##==============================================================================
custom_block <- function(msg = NULL, type = c("information", "caution", "warning", "tip"), title = NULL) {
  type <- match.arg(type)

  if (knitr::is_latex_output()) {
    if (!is.null(title)) {
      title <- paste0("{", title, "}")
    } else {
      title <- "{}"
    }
    
    block <- paste0("\n::: {.infobox", " data-latex=\"{", type, "}", title, "\"}\n", msg, "\n:::\n")
  }
  
  if (knitr::is_html_output()) {
    if (!is.null(title)) {
      block <- paste0("\n::: {.infobox .", type, " data-latex=\"\"}\n**", title, "**\n\n", 
      msg, ":::\n")
    } else {
      block <- paste0("\n::: {.infobox .", type, " data-latex=\"\"}\n", msg, "\n:::\n")
    }
  }
  
  cat(block)
}


##==============================================================================
## quote 블록의 정의
##==============================================================================
quote_block <- function(msg = NULL, speaker = NULL, 
                        align = c("left", "center", "right")) {
  align <- match.arg(align)
  
  if (knitr::is_latex_output()) {
    if (!is.null(speaker)) {
      speaker <- paste0("{", speaker, "}")
    } else {
      speaker <- "{}"
    }
    
    align <- substr(align, 1, 1)
    block <- paste0("\n\\begin{shadequote}[", align, "]", speaker, "\n", msg, "\\end{shadequote}\n")
  }
  
  if (knitr::is_html_output()) {
    if (!is.null(speaker)) {
      block <- paste0("<blockquote class=\"otro-blockquote\">\n", msg, "\n<span>", 
                      speaker, "</span>\n</blockquote>\n")      
    } else {
      block <- paste0("<blockquote class=\"otro-blockquote\">\n", msg, "\n</blockquote>\n")
    }
  }
  
  cat(block)
}


##==============================================================================
## titlebox 블록의 정의
##==============================================================================
titlebox_block <- function(msg = NULL, title = NULL, 
                           theme = c("bluejeans", "grapefruit", "bittersweet", 
                                     "sunflower", "grass", "mint", "aqua", 
                                     "lavander", "pinkrose", "light", "gray", 
                                     "night")) {
  theme <- match.arg(theme)
  if (is.null(theme)) {
    theme <- "bluejeans"
  }
  
  if (knitr::is_latex_output()) {
    block <- paste0("\\titlebox{", title, "}{C", theme, "}{", msg, "}\n") 
  }
  
  if (knitr::is_html_output()) {
    block <- paste0("<titlebox class=\"", theme, "\">\n", 
                    "<h4><span class=\"C", theme, "\">", title, "</span></h4>\n",
                    "<p>", msg, "</p>\n",
                    "</titlebox>\n")
  }
  
  cat(block)
}




library(robotstxt)
library(rvest)

url="https://www.flipkart.com/search?q=realme%20mobiles&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off"
path <- paths_allowed(url)

web <- read_html(url)


Name <- web%>%html_nodes("._4rR01T")%>%html_text()
View(Name)

Price <- web%>%html_nodes("._1_WHN1")%>%html_text()
View(Price)

Rating <- web%>%html_nodes("._2_R_DZ span span:nth-child(1)")%>%html_text()
View(Rating)

reviews= web%>%html_nodes("._13vcmD+ span")%>%html_text()
View(reviews)


mobile <- data.frame(Name,Rating,reviews,price)
View(mobile)

write.csv(mobile, "rawdata.csv")


#data cleaning

mobile1=mobile

mobile1$reviews <- gsub("Reviews","",mobile1$reviews)
View(mobile1$reviews)

mobile1$Rating <- gsub("Ratings","",mobile1$Rating)
View(mobile1$Rating)

mobile1$price <- gsub("<U+20B9>","",mobile$price)
str(mobile1)

View(mobile1)

write.csv(mobile1,"cleandata.csv")

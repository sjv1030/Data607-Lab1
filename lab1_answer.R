# install.packages("plyr")
library(plyr)
 
df <-  read.table("agaricus-lepiota.data",sep=",")
dim(df)

df_e <- subset(df[1],V1 == "e")
nrow(df_e)

df_p <- subset(df[1],V1 == "p")
nrow(df_p)

ans <- df[c(1,21,23,4)]
colnames(ans) <- c("e_p","spore_print_color","habitat","cap_color")

ans$e_p <- mapvalues(ans$e_p, from=c("e","p"), to=c("edible","poisonous"))

ans$spore_print_color <- mapvalues(ans$spore_print_color, 
                                   from=c("k","n","b","h","r","o","u","w","y"),
                                   to=c("black","brown","buff","chocolate","green",
                                        "orange","purple","white","yellow"))

ans$habitat <- mapvalues(ans$habitat, from=c("g","l","m","p","u","w","d"), 
                         to=c("grasses","leaves","meadows","path","urban","waste","woods"))

ans$cap_color <- mapvalues(ans$cap_color, 
                           from=c("n","b","r","u","w","y","c","g","p","e"),
                           to=c("brown","buff","green","purple","white",
                                "yellow","cinnamon", "gray","pink","red"))


# picked habitat and cap-color because together they have 100% accuracy
# when former = leaves and latter = white
# picked spore-print-color because it has a 99.41% accuracy when value is green

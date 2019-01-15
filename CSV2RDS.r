###read all csv files in working directory into memory and save them as an rds file
if (!require("pacman"))
  install.packages("pacman")
pacman::p_load(purrr, readr, rlist)

#Read in all csvs using read_csv from readr and map from purrr
data.list <- map(list.files()[grep(".csv", list.files())], read_csv)

#name the list of tibbles using the file names
names(data.list) <- list.files()[grep(".csv", list.files())]

#export this list as an rds file
list.save(data.list, paste0(Sys.Date(), ".data.list.rds"))

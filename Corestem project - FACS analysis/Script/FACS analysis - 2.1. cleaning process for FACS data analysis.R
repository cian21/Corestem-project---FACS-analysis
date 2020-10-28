# Corestem project - FACS analysis.proj
# 20201028 Sehwan Chun at Corestem, Inc.
# 2.1. cleaning process for FACS data analysis

#### 1. source Loading ####
load("./Data/FACS analysis files.image")

#### 2. data frame melting ####
FACS_file = melt(FACS_file, id.vars = c("Sample","Group"))
FACS_file = FACS_file[complete.cases(FACS_file),]
save(FACS_file, file = "./Data/FACS analysis files melted.Rdata")

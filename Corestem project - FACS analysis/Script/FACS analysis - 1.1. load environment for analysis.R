# Corestem project - FACS analysis.proj
# 20201028 Sehwan Chun at Corestem, Inc.
# 1.1. load environment for analysis

#### 1. Library Loading ####
packs = c("data.table", "dplyr", "ggpubr", "readxl", "reshape2")
lapply(packs, require, character.only = TRUE)
rm(packs)

#### 2. Files Loading ####
FACS_file = "./Data/Rawdata/질환 별 PBMC marker 경향성.xlsx" 
FACS_file = read_xlsx(FACS_file, sheet = 5)
save.image(file = "./Data/FACS analysis files.image")

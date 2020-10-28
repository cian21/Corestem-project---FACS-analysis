# Corestem project - FACS analysis.proj
# 20201028 Sehwan Chun at Corestem, Inc.
# 3.1. FACS data analysis

#### 1. source Loading ####
load("./Data/FACS analysis files melted.Rdata")
source("./Script/Functions/FACS analysis - functions.R")

#### 2. test plot running ####
test_plot_run(FACS_file)

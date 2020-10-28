# Corestem project - FACS analysis.proj
# 20201028 Sehwan Chun at Corestem, Inc.
# functions.R

#### 1. Library Loading ####
packs = c("ggpubr")
lapply(packs, require, character.only = TRUE)
rm(packs)

#### 2. comparison plot ####
test_plot_run = function(FACS_file){
    
    variable_list = as.character(unique(FACS_file$variable))
    my_comparsion = list(c("control","lupus"))
    for (i in 1:length(variable_list)){
        tmp_subset = FACS_file[FACS_file$variable == variable_list[i],]
        if(length(unique(tmp_subset$Group)) == 1){next}
        tmp_var_pvalue = var.test(tmp_subset[tmp_subset$Group == "lupus",4],
                 tmp_subset[tmp_subset$Group != "lupus",4])$p.value
        tmp_plot = ggboxplot(data = tmp_subset,
                  x = "Group",
                  y = "value",
                  fill = "Group",
                  xlab = "Cell type",
                  ylab = "Percent (%)")
        if(tmp_var_pvalue > 0.05){
            tmp_ttest_plot = tmp_plot + stat_compare_means(comparisons = my_comparsion,
                                                     method = "t.test",
                                                     method.args = list(var.equal = TRUE)
            )
            tmp_ttest_plot = ggpar(p = tmp_ttest_plot, main = paste0("T.test of ", variable_list[i]))
        }else{
            tmp_ttest_plot = tmp_plot + stat_compare_means(comparisons = my_comparsion,
                                                     method = "t.test",
                                                     method.args = list(var.equal = FALSE)
            ) 
            tmp_ttest_plot = ggpar(p = tmp_ttest_plot, main = paste0("T.test of ", variable_list[i]))
        }
        tmp_wilcoxon_test_plot = tmp_plot + stat_compare_means(comparisons = my_comparsion,
                                                       method = "wilcox.test")
        tmp_wilcoxon_test_plot = ggpar(p = tmp_wilcoxon_test_plot,  main = paste0("Wilcoxon.test of ", variable_list[i]))
        ggsave(filename = paste0("./Output/Plots/",variable_list[i]," t.test comparison.tiff"),
               plot = tmp_ttest_plot,
               width = 6,
               height = 6,
               dpi = 300,
               device = "tiff")
        
        ggsave(filename = paste0("./Output/Plots/",variable_list[i]," wilcoxon.test comparison.tiff"),
               plot = tmp_wilcoxon_test_plot,
               width = 6,
               height = 6,
               dpi = 300,
               device = "tiff")
    }
}

source("../R/plots.R")

########################################################################################################
# GONCALVES et al 2020 same tree
########################################################################################################

Goncalves2020_1_IQTree <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/IQTree/run_0/au_runtime_table.csv"))
Goncalves2020_2_IQTree <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/IQTree/run_1/au_runtime_table.csv"))
Goncalves2020_3_IQTree <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/IQTree/run_2/au_runtime_table.csv"))
Goncalves2020_4_IQTree <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/IQTree/run_3/au_runtime_table.csv"))
Goncalves2020_5_IQTree <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/IQTree/run_4/au_runtime_table.csv"))

Goncalves2020_1_RAxML <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/RAxML/run_0/au_runtime_table.csv"))
Goncalves2020_2_RAxML <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/RAxML/run_1/au_runtime_table.csv"))
Goncalves2020_3_RAxML <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/RAxML/run_2/au_runtime_table.csv"))
Goncalves2020_4_RAxML <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/RAxML/run_3/au_runtime_table.csv"))
Goncalves2020_5_RAxML <- kuemmerDich(readRun("GoncalvesEtAl2020/multi_AU/RAxML/run_4/au_runtime_table.csv"))

dataIQTree <- list(Goncalves2020_1_IQTree, Goncalves2020_2_IQTree, Goncalves2020_3_IQTree, Goncalves2020_4_IQTree, Goncalves2020_5_IQTree)
dataRAxML <- list(Goncalves2020_1_RAxML, Goncalves2020_2_RAxML, Goncalves2020_3_RAxML, Goncalves2020_4_RAxML, Goncalves2020_5_RAxML)

# biggest standarddeviation: rps4, petN with different AU Test results, rpl36 with different RAxML und ML-IQTree results: petL
plotter(genes = c("rps4","rpl36","petN", "petL"),
        dataIQTree = dataIQTree,
        dataRAxML = dataRAxML,
        nHypo = 4,
        path = "GoncalvesEtAl2020/plots/combined/",
        nPlots = 2,
        nCols = 2,
        hypoName = c("Hypo 1","Hypo 2","Hypo 3","Hypo 4"),
        w = 17,
        h = 19,
        textsize=11)

# Plot all gene boxplots in his own figures
plotter(genes = "all",
        dataIQTree = dataIQTree,
        dataRAxML = dataRAxML,
        nHypo = 4,
        path = "GoncalvesEtAl2020/plots/single/",
        nPlots = "all",
        nCols = 1,
        hypoName = c("Hypo 1","Hypo 2","Hypo 3","Hypo 4"),
        w = 17,
        h = 10,
        showTitle = TRUE,
        showLegend = TRUE)

# Big Plot with all genes in one plot for each hypothesis
derAllesInEinemPlotter(dataIQTree = dataIQTree,
                       dataRAxML = dataRAxML,
                       nHypo = 4,
                       path = "GoncalvesEtAl2020/plots/all/",
                       h = 19,
                       w = 17,
                       textsize = 10)

# Plot standarddeviation
sdPlotter(dataRAxML, dataIQTree, c("Hypo 1", "Hypo 2", "Hypo 3", "Hypo 4"), 5, "GoncalvesEtAl2020/plots/sd/", "Goncavles2020", medianPos = 0.03, roundMedian=5)

# Plot which Hypo is the most likely one
whichHypo(dataRAxML = dataRAxML, dataIQTree = dataIQTree, nRuns = 5, hypos = c("Hypo 1","Hypo 2","Hypo 3","Hypo 4"), path = "GoncalvesEtAl2020/plots/whichHypos/diffHypos.pdf", w = 17, h=13, color = c("#a6cee3","#1f78b4","#b2df8a","#33a02c"), threshold = 0.05)


biplotter(dataRAxML = dataRAxML, dataIQTree = dataIQTree, nRuns = 5, dataset = "Goncalves et al. 2020", hypos = c("Hypo 1","Hypo 2","Hypo 3","Hypo 4"), path = "GoncalvesEtAl2020/plots/biplot", w = 17, h = 10)

########################################################################################################
# GONCALVES et al 2020 One Tree
########################################################################################################

dataRAxML <- list(kuemmerDich(readRun("GoncalvesEtAl2020/single_AU/output_IQTree2_RAxML/SUMMARY/au_runtime_table.csv")))
dataIQTree <- list(kuemmerDich(readRun("GoncalvesEtAl2020/single_AU/output_IQTree2_IQTree/SUMMARY/au_runtime_table.csv")))
sdPlotter(dataRAxML = dataRAxML, dataIQTree = dataIQTree, hypo = c("Hypo 1", "Hypo 2", "Hypo 3", "Hypo 4"), nRuns = 1, path = "GoncalvesEtAl2020/plots/sd/", dataset = "Goncavles2020", medianPos = 0.06, roundMedian=5)
percentageOfSigRejections(dataRAxML = dataRAxML, dataIQTree = dataIQTree, hypos = c("Hypo 1", "Hypo 2", "Hypo 3", "Hypo 4"), path = "GoncalvesEtAl2020/plots/numberOfSigReject/", dataset = "GoncalvesEtAl2020", w = 12, h = 8, threshold = 0.05)


# GONCALVES et al 2019 same Tree
########################################################################################################

Goncalves2019_1_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_cd/run_0/au_runtime_table.csv"), "_cd")
Goncalves2019_1_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ex/run_0/au_runtime_table.csv"), "_ex")
Goncalves2019_1_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ge/run_0/au_runtime_table.csv"), "_ge")
Goncalves2019_1_RAxML <- cbind(Goncalves2019_1_cd[1:3], Goncalves2019_1_ex[1:3], Goncalves2019_1_ge[1:3])

Goncalves2019_2_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_cd/run_1/au_runtime_table.csv"), "_cd")
Goncalves2019_2_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ex/run_1/au_runtime_table.csv"), "_ex")
Goncalves2019_2_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ge/run_1/au_runtime_table.csv"), "_ge")
Goncalves2019_2_RAxML <- cbind(Goncalves2019_2_cd[1:3], Goncalves2019_2_ex[1:3], Goncalves2019_2_ge[1:3])

Goncalves2019_3_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_cd/run_2/au_runtime_table.csv"), "_cd")
Goncalves2019_3_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ex/run_2/au_runtime_table.csv"), "_ex")
Goncalves2019_3_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ge/run_2/au_runtime_table.csv"), "_ge")
Goncalves2019_3_RAxML <- cbind(Goncalves2019_3_cd[1:3], Goncalves2019_3_ex[1:3], Goncalves2019_3_ge[1:3])

Goncalves2019_4_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_cd/run_3/au_runtime_table.csv"), "_cd")
Goncalves2019_4_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ex/run_3/au_runtime_table.csv"), "_ex")
Goncalves2019_4_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ge/run_3/au_runtime_table.csv"), "_ge")
Goncalves2019_4_RAxML <- cbind(Goncalves2019_4_cd[1:3], Goncalves2019_4_ex[1:3], Goncalves2019_4_ge[1:3])

Goncalves2019_5_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_cd/run_4/au_runtime_table.csv"), "_cd")
Goncalves2019_5_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ex/run_4/au_runtime_table.csv"), "_ex")
Goncalves2019_5_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ge/run_4/au_runtime_table.csv"), "_ge")
Goncalves2019_5_RAxML <- cbind(Goncalves2019_5_cd[1:3], Goncalves2019_5_ex[1:3], Goncalves2019_5_ge[1:3])

Goncalves2019_1_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_cd/run_0/au_runtime_table.csv"), "_cd")
Goncalves2019_1_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ex/run_0/au_runtime_table.csv"), "_ex")
Goncalves2019_1_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ge/run_0/au_runtime_table.csv"), "_ge")
Goncalves2019_1_IQTree <- cbind(Goncalves2019_1_cd[1:3], Goncalves2019_1_ex[1:3], Goncalves2019_1_ge[1:3])

Goncalves2019_2_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_cd/run_1/au_runtime_table.csv"), "_cd")
Goncalves2019_2_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ex/run_1/au_runtime_table.csv"), "_ex")
Goncalves2019_2_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ge/run_1/au_runtime_table.csv"), "_ge")
Goncalves2019_2_IQTree <- cbind(Goncalves2019_2_cd[1:3], Goncalves2019_2_ex[1:3], Goncalves2019_2_ge[1:3])

Goncalves2019_3_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_cd/run_2/au_runtime_table.csv"), "_cd")
Goncalves2019_3_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ex/run_2/au_runtime_table.csv"), "_ex")
Goncalves2019_3_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ge/run_2/au_runtime_table.csv"), "_ge")
Goncalves2019_3_IQTree <- cbind(Goncalves2019_3_cd[1:3], Goncalves2019_3_ex[1:3], Goncalves2019_3_ge[1:3])

Goncalves2019_4_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_cd/run_3/au_runtime_table.csv"), "_cd")
Goncalves2019_4_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ex/run_3/au_runtime_table.csv"), "_ex")
Goncalves2019_4_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/IQTree_ge/run_3/au_runtime_table.csv"), "_ge")
Goncalves2019_4_IQTree <- cbind(Goncalves2019_4_cd[1:3], Goncalves2019_4_ex[1:3], Goncalves2019_4_ge[1:3])

Goncalves2019_5_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_cd/run_4/au_runtime_table.csv"), "_cd")
Goncalves2019_5_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ex/run_4/au_runtime_table.csv"), "_ex")
Goncalves2019_5_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/multi_AU/RAxML_ge/run_4/au_runtime_table.csv"), "_ge")
Goncalves2019_5_IQTree <- cbind(Goncalves2019_5_cd[1:3], Goncalves2019_5_ex[1:3], Goncalves2019_5_ge[1:3])

dataRAxML <- list(Goncalves2019_1_RAxML, Goncalves2019_2_RAxML, Goncalves2019_3_RAxML, Goncalves2019_4_RAxML, Goncalves2019_5_RAxML)
dataIQTree <- list(Goncalves2019_1_IQTree, Goncalves2019_2_IQTree, Goncalves2019_3_IQTree, Goncalves2019_4_IQTree, Goncalves2019_5_IQTree)

sdPlotter(dataRAxML = dataRAxML, dataIQTree = dataIQTree, hypo = c("codon-aligned", "exon", "gene"), nRuns = 5, path = "GoncalvesEtAl2019/plots/sd/", dataset = "Goncavles2019", medianPos = 0.0017, roundMedian=5)
whichHypo(dataRAxML = dataRAxML, dataIQTree = dataIQTree, nRuns = 5, hypos = c("codon-aligned", "exon", "gene"), path = "GoncalvesEtAl2019/plots/whichHypo/diffHypos.pdf", w = 17, h = 12, color = c("#a6cee3","#1f78b4","#b2df8a"), threshold = 0.05)
biplotter(dataRAxML = dataRAxML, dataIQTree = dataIQTree, nRuns = 5, dataset = "Goncalves et al. 2019", hypos = c("codon-alinged","exon","gene"), path = "GoncalvesEtAl2019/plots/biplot", w = 17, h = 10)

# biggest standard deviation: psbB, rps3, atpB with different AU Test results: rbcL with different RAxML und IQTree Results
plotter(genes = c("psbB","atpB","rps3", "rbcL"),
        dataIQTree = dataIQTree,
        dataRAxML = dataRAxML,
        nHypo = 3,
        path = "GoncalvesEtAl2019/plots/combined/",
        nPlots = 2,
        nCols = 2,
        hypoName = c("cd","ex","ge"),
        w=17,
        h=19,
        textsize=11)

plotter(genes = "all",
        dataIQTree = dataIQTree,
        dataRAxML = dataRAxML,
        nHypo = 3,
        path = "GoncalvesEtAl2019/plots/single/",
        nPlots = "all",
        nCols = 1,
        hypoName = c("codon-aligend","exon","gene"),
        w = 17,
        h = 10,
        showTitle = TRUE,
        showLegend = TRUE)

derAllesInEinemPlotter(dataRAxML = dataRAxML,
                       dataIQTree = dataIQTree,
                       nHypo = 3,
                       path = "GoncalvesEtAl2019/plots/all/",
                       w=17,
                       h=19,
                       textsize = 10)


########################################################################################################
# GONCALVES et al 2019 One Run
########################################################################################################

Goncalves2019_cd <- kuemmerDich(readRun("GoncalvesEtAl2019/single_AU/output_cd_IQTree_RAxML.csv"), "_cd")
Goncalves2019_ex <- kuemmerDich(readRun("GoncalvesEtAl2019/single_AU/output_ex_IQTree_RAxML.csv"), "_ex")
Goncalves2019_ge <- kuemmerDich(readRun("GoncalvesEtAl2019/single_AU/output_ge_IQTree_RAxML.csv"), "_ge")
dataIQTree <- list(cbind(Goncalves2019_cd[1:3], Goncalves2019_ex[1:3], Goncalves2019_ge[1:3]))
dataRAxML <- list(cbind(Goncalves2019_cd[4:6], Goncalves2019_ex[4:6], Goncalves2019_ge[4:6]))

sdPlotter(dataRAxML = dataRAxML, dataIQTree = dataIQTree, hypo = c("codon-aligned", "exon", "gene"), nRuns = 1, path = "GoncalvesEtAl2019/plots/sd/", dataset = "Goncavles2019", medianPos = 0.004, roundMedian = 5)
percentageOfSigRejections(dataRAxML = dataRAxML, dataIQTree = dataIQTree, hypos = c("codon-aligned", "exon", "gene"), path = "GoncalvesEtAl2019/plots/numberOfSigReject/", dataset = "GoncalvesEtAl2019", w = 12, h = 8, threshold = 0.05)


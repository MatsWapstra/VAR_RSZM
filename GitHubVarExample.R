library(HDGCvar)
library(igraph)
# Load data for a station you wish to choose
#station_data <- read.csv("C:/path")


# Select the lag length using BIC function
selected_lag_station <- lags_upbound_BIC(station_data, p_max = 10)

interest_variables=list("GCto"="VariableName1","GCfrom"="VariableName2")

# Run HDGC_VAR for a chosen pair.
#results_two <- HDGC_VAR(GCpair=interest_variables, data=station_data, p = selected_lag_station, d = 2, bound = 0.5 * nrow(dataset), parallel = T, n_cores = NULL)

# Run HDGC_VAR_all for all variable pairs
results_all <- HDGC_VAR_all(data = station_data, p = selected_lag_station, d = 2, bound = 0.5 * nrow(station_data), parallel = FALSE, n_cores = NULL)

# Print or visualize the results as needed
#print(results_two)
#print(results_all)

#We plot the connections as shown in the github
Plot_GC_all(results_all, Stat_type="FS_cor",alpha=0.01, multip_corr=list(F),directed=T, layout=layout.circle, main="Results",edge.arrow.size=.2,vertex.size=5, vertex.color=c("lightblue"), vertex.frame.color="blue",vertex.label.size=2,vertex.label.color="black",vertex.label.cex=0.6, vertex.label.dist=1, edge.curved=0,cluster=list(T,5,"black",0.8,1,0)) 

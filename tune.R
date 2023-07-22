### TUNING FILE 

# ELASTIC NET REGRESSION
tune_en <- tune_grid(
  en_wf, 
  resamples = data_folds, 
  grid = en_grid
)


# RANDOM FOREST
tune_rf <- tune_grid(
  rf_wf,  
  resamples = data_folds, 
  grid = rf_grid
)


# BOOSTED TREE
tune_bt <- tune_grid(
  bt_wf, 
  resamples = data_folds, 
  grid = bt_grid
)

# SUPPORT VECTOR MACHINE
tune_svm <- tune_grid(
  svm_wf, 
  resamples = data_folds, 
  grid = svm_grid
)

# write_rds(tune_en, file="tune_en.rds")
# write_rds(tune_rf, file="tune_rf.rds")
# write_rds(tune_bt, file="tune_bt.rds")
# write_rds(tune_svm, file="tune_svm.rds")

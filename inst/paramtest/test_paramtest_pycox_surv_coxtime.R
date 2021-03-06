library(mlr3extralearners)
install_learners("surv.coxtime")

test_that("surv.coxtime prepare_train_data", {
  learner = lrn("surv.coxtime")
  fun = prepare_train_data
  exclude = c(
    "task", # handled internally
    "model", # handled internally
    "discretise", # unused
    "cuts", # unused
    "cutpoints", # unused
    "scheme", # unused
    "cut_min" # unused
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0("\nMissing parameters:\n",
    paste0("- '", ParamTest$missing, "'", collapse = "\n")))
})

test_that("surv.coxtime get_activation", {
  learner = lrn("surv.coxtime")
  fun = get_pycox_activation
  exclude = c(
    "construct", # handled internally
    "dim", # unused
    "min_val", # unused
    "max_val", # unused
    "negative_slope", # unused
    "num_parameters", # unused
    "init", # unused
    "lower", # unused
    "upper", # unused
    "beta", # unused
    "threshold", # unused
    "value" # unused
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0("\nMissing parameters:\n",
                                       paste0("- '", ParamTest$missing, "'", collapse = "\n")))
})

test_that("surv.coxtime get_optim", {
  learner = lrn("surv.coxtime")
  fun = get_pycox_optim
  exclude = c(
    "net" # handled internally
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0("\nMissing parameters:\n",
                                       paste0("- '", ParamTest$missing, "'", collapse = "\n")))
})

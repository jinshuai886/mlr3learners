skip_if_not_installed("glmnet")

test_that("autotest", {
  learner = mlr3::lrn("surv.cv_glmnet")
  expect_learner(learner)

  skip_on_os("solaris")
  result = run_autotest(learner, exclude = "feat_single", check_replicable = FALSE)
  expect_true(result, info = result$error)
})

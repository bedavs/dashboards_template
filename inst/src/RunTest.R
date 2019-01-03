con <- file("/tmp/computer", "r")
COMPUTER_NAME <- readLines(con, n = 1)
close(con)
Sys.setenv(COMPUTER = COMPUTER_NAME)

for (baseFolder in c("/data_clean", "/results", "/data_app")) {
  files <- list.files(file.path(baseFolder, "xxxx"))
  if (length(files) > 0) {
    for (f in files) unlink(file.path(baseFolder, "xxxx", f))
  }
}

unlink(file.path("/junit", "xxxx.xml"))

Sys.sleep(1)

a <- testthat:::JunitReporter$new()
a$start_reporter()
a$out <- file(file.path("/junit", "xxxx.xml"), "w+")
a$start_context("sykdomspuls_log")

# if(FALSE){
output <- processx::run("Rscript", "/r/xxxx/src/RunProcess.R", error_on_status = F, echo = T)
cat("\n\nstdout\n\n")
cat(output$stdout)
cat("\n\nstderr\n\n")
cat(output$stderr)

if (output$status == 0) {
  a$add_result("xxxx", "RunAll", testthat::expectation("success", "Pass"))
} else {
  a$add_result("xxxx", "RunAll", testthat::expectation("error", "Fail"))
}
# } else {
a$add_result("xxxx", "RunAll", testthat::expectation("success", "Pass"))
# }

a$end_context("xxxx")
a$end_reporter()
close(a$out)

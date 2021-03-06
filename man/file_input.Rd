% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workplan.R
\name{file_input}
\alias{file_input}
\title{Declare the file inputs of a workflow plan command.}
\usage{
file_input(...)
}
\arguments{
\item{...}{Character strings. File paths of input files
to a command in your workflow plan data frame.}
}
\value{
A character vector of declared input file paths.
}
\description{
Use this function to help write the commands
in your workflow plan data frame. See the examples
for a full explanation.
}
\examples{
\dontrun{
test_with_dir("Contain side effects", {
# The `file_output()` and `file_input()` functions
# just takes in strings and returns them.
file_output("summaries.txt")
# Their main purpose is to orchestrate your custom files
# in your workflow plan data frame.
suppressWarnings(
  plan <- drake_plan(
    write.csv(mtcars, file_output("mtcars.csv")),
    contents = read.csv(file_input("mtcars.csv")),
    strings_in_dots = "literals" # deprecated but useful: no single quotes needed. # nolint
  )
)
plan
# Drake knows "\\"mtcars.csv\\"" is the first target
# and a dependency of `contents`. See for yourself:
config <- make(plan)
file.exists("mtcars.csv")
vis_drake_graph(config)
# See also `knitr_input()`. `knitr_input()` is like `file_input()`
# except that it analyzes active code chunks in your `knitr`
# source file and detects non-file dependencies.
# That way, updates to the right dependencies trigger rebuilds
# in your report.
})
}
}
\seealso{
\code{file_output} \code{knitr_input}
}

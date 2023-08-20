##Setting Up Github

install.packages("usethis")

usethis::use_git_config(user.name = "Alexandra Kauffman", user.email = "akauff2@emory.edu")

usethis::create_github_token()

gitcreds::gitcreds_set()


##Install Dataset

install.packages("medicaldata")
library(medicaldata)

data(package = "medicaldata")

covid_testing <- medicaldata::covid_testing


##Sumary Table
install.packages("gtsummary")
library(gtsummary)

tbl_summary(
	covid_testing,
	by = result,
	include = c(age, gender, patient_class),
	label = list(
		age ~ "Patient Age",
		gender ~ "Patient Gender",
		patient_class ~ "Patient Class"
	),
	add_p(test = list(all_continuous() ~ "t.test",
										all_categorical() ~ "chisq.test")) |>
	add_overall(col_label = "**Total**") |>
 )


##Setting Up Github

install.packages("usethis")

usethis::use_git_config(user.name = "Alexandra Kauffman", user.email = "akauff2@emory.edu")

usethis::create_github_token()

gitcreds::gitcreds_set()


##Install Dataset from medicaldata Github and saving csv

install.packages("medicaldata")
library(medicaldata)

data(package = "medicaldata")

covid <- medicaldata::covid_testing

write.csv(x = covid, file = "covid.csv")


##Call file for data analysis from "Here"

install.packages("here")
covid_testing <- here::here("covid_testing.csv")



##Summary Table
install.packages("gtsummary")
library(gtsummary)

Descriptive_Table <- tbl_summary(
covid_testing,
	by = result,
	include = c(age, gender, patient_class),
	label = list(
		age ~ "Patient Age",
		gender ~ "Patient Gender",
		patient_class ~ "Patient Class"
	),
	missing_text = "Missing") |>
	add_p(test = list(all_continuous() ~ "t.test",
										all_categorical() ~ "chisq.test")) |>
	add_overall(col_label = "**Total**") |>
	bold_labels() |>
	modify_footnote(update = everything() ~ NA) |>
	modify_header(label = "**Variable**", p.value = "**P**")



##Regression

tbl_uvregression(
	covid_testing,
	y = age,
	include = c(col_rec_tat, rec_ver_tat),
	label = list(
		col_rec_tat ~ "Time elapsed, collect time to receive time",
		rec_ver_tat ~ "Time elapsed,  receive time to verification time"
	),
	method = lm)



##Figure
hist(covid_testing$age)



##Write and run function (I chose to find the mean patients' age in months)

mean.age.in.months <- function(x) {
	l <- length(x)
	mean <- sum(x)/l
	mean.in.months <- mean*12
	return(mean.in.months)
}

mean.age.in.months(x = covid_testing$age)


















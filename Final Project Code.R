##Setting Up Github

install.packages("usethis")

usethis::use_git_config(user.name = "Alexandra Kauffman", user.email = "akauff2@emory.edu")

usethis::create_github_token()

gitcreds::gitcreds_set()


Given /^I am logged in$/ do
  visit(path_to("logged_in"))
  fill_in 'Login', :with => 'email@yahoo.com'
  fill_in 'Password', :with => 'super_secret'
  click 'Sign in'
  Then "I should see \"Sign in!\""
end
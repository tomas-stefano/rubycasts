
Given /^I am logged in$/ do
  visit(path_to("logged_in"))
  fill_in 'Login', :with => 'email@yahoo.com'
  fill_in 'Password', :with => 'super_secret'
  click_button 'Sign in'
  Then "I should see \"Sign in!\""
end

Given /^I am not logged in$/ do
  visit(path_to('the homepage'))
end


Given /^I am logged in$/ do
  visit(path_to("logged_in"))
  
  email = 'email@gmail.com'
  password = 'super_secret'
  
  User.create(:email => email, :password => password)
  
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  
  click_button 'Sign in'
  
  Then "I should see \"Sign in!\""
end

Given /^I am not logged in$/ do
  visit(path_to('the homepage'))
end


Given /^I have seven episodes:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I upload a video$/ do
  click_link('Upload Episode')
  fill_in('title', :with => 'RubyCasts =]')
  fill_in('description', :with => 'I will talk about RubyCasts')
  attach_file('episode_video', :with => video_episode_file)
end

When /^I upload a video without a file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see the video in the rubycats page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the video in the rubycats page$/ do
  pending # express the regexp above with the code you wish you had
end

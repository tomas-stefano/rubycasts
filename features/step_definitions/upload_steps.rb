# coding: utf-8

Given /^I have seven episodes:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I upload a video$/ do
  click_link('New Episode')
  @episode = create_an_episode_instance
  fill_in('title', :with => @episode.title)
  fill_in('description', :with => @episode.description)
  fill_in('video_uri', :with => @episode.video_uri)
  fill_in('duration', :with => @episode.duration)
  click_button 'Create'
end

When /^I upload a video without a file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see the video in the rubycats page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the video in the rubycasts page$/ do
  page.should have_content(@episode.title)
  page.should have_content(@episode.description)
  page.should have_content(@episode.duration)
end

Then /^I should be redirected to rubycasts page$/ do
  page.should have_content("Episódios")
  page.should have_content("Sobre")
  page.should have_content("Feedback")
  page.should have_selector("#current_episode")
end

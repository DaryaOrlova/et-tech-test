Given /^I have opened "([^\"]*)"$/ do |url|
     visit url
end

And /^I navigate to page "([^\"]+)"$/ do |label|
    click_on label
end

And /I navigate to subarea "([^\"]+)" in area "([^\"]+)"$/ do |subarea, area|
    page.find(:xpath,"//*[text()='#{area}' and contains(@class, 'ban hot')]").click
    click_on subarea
end

Then /I should be redirected to URL "([^\"]+)"$/ do |url|
    expect(page).to have_current_path(url)
end

Then /I should be redirected to new domain "([^\"]+)"$/ do |url|
    expect(current_url).to eq(url)
end











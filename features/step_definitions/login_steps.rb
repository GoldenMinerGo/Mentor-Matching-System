Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
end
end

Then(/^I will nullify my session hash$/) do
  session[:user_id] = nil
end

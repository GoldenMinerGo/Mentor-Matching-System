
Then(/^I will nullify my session hash$/) do
  session[:user_id] = nil
end
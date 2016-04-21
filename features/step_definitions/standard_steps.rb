##parent step
##group step


Given (/^the following (.*) exist:$/) do |type, table| 
    if type == "User"
        table.hashes.each do |element|
            User.create!(element)
        end
    end
    if type == "Parent"
        table.hashes.each do |element|
            Parent.create!(element)
        end
    end
    if type == "Child"
        table.hashes.each do |element|
            Child.create!(element)
        end
    end
    if type == "Invitation"
        table.hashes.each do |element|
            Invitation.create!(element)
        end
    end
    if type == "Group"
        table.hashes.each do |element|
            Group.create!(element)
        end
    end
    if type == "Mentor"
        table.hashes.each do |element|
            Mentor.create!(element)
        end
    end
    if type == "Groupinv"
        table.hashes.each do |element|
            Groupinv.create!(element)
        end
    end
end


Given /^(?:|I )am on (.+)$/ do |page_name|
   visit path_to(page_name)
end
 
When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )choose "([^"]*)"$/ do |field|
  choose(field)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.index(e1).should < page.body.index(e2)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
   if current_path.respond_to? :should
     current_path.should == path_to(page_name)
   else
     assert_equal path_to(page_name), current_path
   end
 end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
   if page.respond_to? :should
     page.should have_no_content(text)
   else
     assert page.has_no_content?(text)
   end
 end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
   click_link(link)
end

When /^(?:|I )follow first group's "([^"]*)"$/ do |link|
    visit(group_path(1))
end

When /^(?:|I )follow second child's "([^"]*)"$/ do |link|
    visit(child_path(2))
end

When /^(?:|I )press the first "([^"]*)"$/ do |button|
  visit(change_group_path(1))
end

##mentor steps

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

Then(/^I will nullify my session hash$/) do
  session[:user_id] = nil
end

=begin
    group invitations steps
=end

When(/^I follow second mentor's "([^"]*)"$/) do |arg1|
  visit(groupinvs_send_inv_path(1,2,false))
end

When(/^I follow first group "([^"]*)"$/) do |arg1|
  visit(groupinvs_send_inv_path(1,1,true))
end

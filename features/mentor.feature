Feature: Mentor edit
  As a mentor 
  I would like to be able to edit my profile 
  So that I could change it to fit in my status

  Mentor delete
  As a coach
  I would like to see that mentors can delete themselves when they don't want to teach anymore
  So that I dont have to waste time waiting for an absent mentor
  
  Mentor quit group
  As a mentor
  I would like to be able to quit the group
  So that I can find another when I don't like this group

Background: users, parents, children, groups, invitations, mentors in database
  Given the following User exist:
    | username    | password | role     | last_login_time |
    | user1       | 1q2w3e   | Parent   | 1977-05-25      |
    | user2       | 1q2w3e   | Parent   | 1982-06-25      |
    | user3       | 1q2w3e   | Mentor   | 1979-05-25      |

  Given the following Parent exist:
    |user_id | firstname | lastname | phone      | email          |
    |1       | Lei       | Li       | 9796760001 | user1@tamu.edu |
    |4       | Ming      | Xiao     | 9796760004 | user4@tamu.edu |
    |5       | Liangchen | Ye       | 9796760006 | user6@tamu.edu |
    
  Given the following Child exist:
    |parent_id| firstname| lastname| gender| age| school  | grade| time_slot         | str_com           | description | visible | group_id |
    |1        | Alei     | Lei     | male  | 5  | school 1| G1   | 12:00 - 13:00 Mon | BEST，FIRST       | heiheihei   | true    | 1        |
    |1        | Bi       | Dou     | male  | 7  | school 1| G2   | 12:00 - 13:00 Mon | BEST，FIRST       | hahahaha    | true    | 2        |
    |1        | Ma       | Ni      | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon | BEST，FIRST       | hahahaha    | false   | 1        |
    
  Given the following Group exist:
    |title  | admin_id| mentor_id| time_slot         | str_com       | description | visible |
    |group 1| 1       | 1        | 12:00 - 13:00 Mon | BEST          | heiheihei   | true    |
    |group 2| 2       | 2        | 12:00 - 13:00 Mon | FIRST         | heiheihei   | true    |
    
  Given the following Invitation exist:
    | group_id | sender_id | receiver_id| status  |
    | 2        | 1         | 3          | pending |
    | 1        | 2         | 1          | declined|
    
  Given the following Mentor exist:
    |user_id| firstname| lastname| phone       | email          | gender  | date_of_birth | school | grade |time_slot         | competitions | description | visible |
    |2      | Nima     | Cao     | 9796760002  | nima@tamu.edu  | male    | 1993-06-18    | tamu   | U1    |12:00 - 13:00 Mon | ['BEST']     | heiheihei   | false   |
    |3      | Yibi     | keng    | 9796734502  | yibi@tamu.edu  | female  | 1993-06-19    | ecnu   | U2    |12:00 - 13:00 Mon | ['FIRST']    | heiheihei   | true    |
  
  Given I am on the home page of Mentor Matching System
  And I fill in "username" with "user3"
  And I fill in "login_password" with "1q2w3e"
  And I press "Log In"

Scenario: Mentor edit
  When I follow "Update Personal Information"
  When I fill in "mentor[lastname]" with "Keng"
  And I press "Update" 
  Then I should see "Successfully"
  And I should see "Keng"
  And I should not see "keng"

Scenario: Show all mentors
  When I am on the Mentor Index page
  Then I should not see "Nima"
  And I should see "Yibi"
  
Scenario: Mentor quit group
  When I follow "Quit the group"
  Then I should see "Yibi"
  And I should not see "group 1"
  
Scenario: Mentor delete 
  When I follow "Delete"
  Then I should be on the home page of Mentor Matching System
  And I should see "successfully"
  

Scenario: Mentor edit failure (sad path)
  When I follow "Update Personal Information"
  When I fill in "mentor[date_of_birth]" with "2017-01-01"
  And I fill in "mentor[lastname]" with "Keng"
  And I press "Update"
  Then I should not see "Keng"
  Then I should see "Invalid"


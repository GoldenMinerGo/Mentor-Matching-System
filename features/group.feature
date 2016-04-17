Feature: check group information
  As an user
  I want to check my group information including group ID, group title, mentor of the group and members of the group.
  I also want to sort for the group title and num of members by clicking on the relevant buttons.
  
  Background: users, parents, children, groups, invitations and mentors in database
  
  Given the following User exist:
    | username    | password | role     | last_login_time |
    | user1       | 1q2w3e   | parent   | 1977-05-25      |
    | user2       | 1q2w3e   | parent   | 1982-06-25      |
    | user3       | 1q2w3e   | mentor   | 1979-05-25      |

  Given the following Parent exist:
    |user_id | firstname | lastname | phone      | email          |
    |1       | Lei       | Li       | 9796760001 | user1@tamu.edu |
    |4       | Ming      | Xiao     | 9796760004 | user4@tamu.edu |
    |5       | Liangchen | Ye       | 9796760006 | user6@tamu.edu |
    
  Given the following Child exist:
    |parent_id| firstname| lastname| gender| age| school  | grade| time_slot         |    str_com        | description | visible | group_id |
    |1        | Alei     | Lei     | male  | 5  | school 1| G1   | 12:00 - 13:00 Mon |   BEST,FIRST      | heiheihei   | true    | 1        |
    |1        | Bi       | Dou     | male  | 7  | school 1| G2   | 12:00 - 13:00 Mon |   BEST,FIRST      | hahahaha    | true    | 2        |
    |1        | Ma       | Ni      | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon |   BEST,FIRST      | hahahaha    | false   | 1        |
    |5        | A        | Mei     | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon |   BEST,FIRST      | hahahaha    | false   | 2        |                           
  Given the following Group exist:
    |title  | admin_id| mentor_id| time_slot         | str_com      | description | visible |
    |group 1| 1       | 1        | 12:00 - 13:00 Mon | BEST          | heiheihei   | true    |
    |group 2| 2       | 2        | 12:00 - 13:00 Mon | FIRST         | heiheihei   | true    |
    
  Given the following Invitation exist:
    | group_id | sender_id | receiver_id| status  |
    | 2        | 1         | 3          | pending |
    | 1        | 2         | 1          | declined|
    
  Given the following Mentor exist:
    |user_id| firstname| lastname| phone       | email          | gender  | date_of_birth | school | grade |time_slot         | competitions | description | visible |
    |2      | Nima     | Cao     | 9796760002  | nima@tamu.edu  | male    | 1993-06-18    | tamu   | U1    |12:00 - 13:00 Mon | ['BEST']     | heiheihei   | false   |
    |3      | Yibi     | keng    | 9796734502  | yibi@tamu.edu  | female  | 1993-06-18    | ecnu   | U2    |12:00 - 13:00 Mon | ['FIRST']    | heiheihei   | true    |

 
Given I am on the home page of Mentor Matching System
    When I fill in "username" with "user1"
    And I fill in "login_password" with "1q2w3e"
    And I press "Log In"

Scenario: see group information
Then I should be on the parent page
And I should see "group 1"

#test index
Scenario: see all group information
When I go to the Group page
And I should see "group 1"
And I should see "group 2"
    
#Scenario: show group information
#When I go to the Group Information page
#Then I should see "Bi Dou"
#Then I should see "Alei lei"
#Then I should see "Ma Ni"

#test create
Scenario: add a new group
When I go to the parent dashboard page
When I follow "Add a group"
Then I should be on the New Group page
And I fill in "group[title]" with "GoldenMiner"
#And I fill in "group[time_slot]" with "12:00"
And I fill in "group[str_com]" with "Olympics"
And I press "Create"
Then I should see "GoldenMiner"
Then I should see "Olympics"

#test update
Scenario: update group information
When I go to the Group Information page
When I follow "Update Group Information"
Then I should be on the group edit page
And I fill in "group[title]" with "SilverMiner"
#And I fill in "group[time_slot]"with "12:00"
And I fill in "group[str_com]" with "SportsMeeting"
And I press "Update"
Then I should see "SilverMiner"
#Then I should see "12:00"
Then I should see "SportsMeeting"

#test change
Scenario: delete the member
#When I go to the parent dashboard page
#And I follow "More"
#Then I should be on the Group Information page
#And I follow "Delete"
When I go to the Group Information page
When I follow the first "Delete"
Then I should be on the Group Information page
Then I should not see "Alei Lei"

Scenario: close the group
When I go to the Group Information page
And I follow "Close this group"
Then I should be on the parent dashboard page

Scenario: sort by group title
When I go to the Group page
And I follow "Group Title"
Then I should see "group 1" before "group 2"

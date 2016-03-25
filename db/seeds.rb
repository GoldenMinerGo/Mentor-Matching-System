users = [
	{:username => 'user1', :password => 'GSetrdVGt', :role => 'parent', :firstname => 'Lei', :lastname => 'Li', :phone => '9796760001', :email => 'user1@tamu.edu',  :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	
	{:username => 'user2', :password => 'g3fw4f43rf', :role => 'mentor', :firstname => 'Meimei', :lastname => 'Han', :phone => '9796760002', :email => 'user2@tamu.edu', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	
	{:username => 'user3', :password => 'TrrtVDttv', :role => 'mentor', :firstname => 'Hua', :lastname => 'Wang', :phone => '9796760003', :email => 'user3@tamu.edu', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	
	{:username => 'user4', :password => 'TbRSTVStf', :role => 'parent', :firstname => 'Ming', :lastname => 'Xiao', :phone => '9796760004', :email => 'user4@tamu.edu',  :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	
	{:username => 'user5', :password => 'g3fw4f43rf', :role => 'parent', :firstname => 'Ritian', :lastname => 'Zhao', :phone => '9796760005', :email => 'user5@tamu.edu', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	
	{:username => 'user6', :password => 'TrrtVDttv', :role => 'parent', :firstname => 'Liangchen', :lastname => 'Ye', :phone => '9796760006', :email => 'user6@tamu.edu', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")}
]

children = [
	{:parent_id => 1, :firstname =>'Alei', :lastname => 'Lei', :gender => 'male', :age => 5, :school => 'School 1', :grade => 'G1', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST', 'FIRST'], :description => '...', :visible => true},
	
	{:parent_id => 1, :firstname =>'Haha', :lastname => 'Oh', :gender => 'female', :age => 7, :school => 'School 2', :grade => 'G1', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true},
	
	{:parent_id => 1, :firstname =>'Yeh', :lastname => 'Yeh', :gender => 'male', :age => 3, :school => 'School 1', :grade => 'G2', :time_slot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => false},
	
	{:parent_id => 5, :firstname =>'Heihei', :lastname => 'Hei', :gender => 'female', :age => 5, :school => 'School 2', :grade => 'G2', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST', 'FIRST'], :description => '...', :visible => true},
	
	{:parent_id => 5, :firstname =>'Hehe', :lastname => 'Le', :gender => 'male', :age => 7, :school => 'School 1', :grade => 'G2', :time_slot => '12:00 - 13:00 Mon', :competitions => [], :description => '...', :visible => false}
]


groups = [
	{:title => 'title1', :admin_id => 1, :mentor_id => 0, :children_id => [1,3], :time_slot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => true},
	
	{:title => 'title2', :admin_id => 2, :mentor_id => 2, :children_id => [2,4], :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true}
]


mentors = [
	{:user_id => 2, :gender => 'male', :age => 25, :school => 'School 5', :grade => 'U1', :time_slot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => false},
	
	{:user_id => 3, :gender => 'female', :age => 20, :school => 'School 6', :grade => 'U3', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true}
]

invitations = [
	{:group_id => 2, :sender_id => 2, :receiver_id => 5, :status => 'pending'},

	{:group_id => 1, :sender_id => 1, :receiver_id => 5, :status => 'decline'}
]

users.each do |user|
  User.create!(user)
end

children.each do |child|
  Child.create!(child)
end

groups.each do |group|
  Group.create!(group)
end

mentors.each do |mentor|
  Mentor.create!(mentor)
end

invitations.each do |invitation|
  Invitation.create!(invitation)
end
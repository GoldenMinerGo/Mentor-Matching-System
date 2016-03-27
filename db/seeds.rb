users = [
	{:username => 'user1', :password => 'GSetrdVGt', :role => 'parent', :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	
	{:username => 'user2', :password => 'g3fw4f43rf', :role => 'mentor', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	
	{:username => 'user3', :password => 'TrrtVDttv', :role => 'mentor', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	
	{:username => 'user4', :password => 'TbRSTVStf', :role => 'parent', :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	
	{:username => 'user5', :password => 'g3fw4f43rf', :role => 'parent', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	
	{:username => 'user6', :password => 'TrrtVDttv', :role => 'parent', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")}
]

users.each do |user|
  User.create!(user)
end


mentors = [
	{:user_id => User.find(2).id, :firstname => 'Meimei', :lastname => 'Han', :phone => '9796760002', :email => 'user2@tamu.edu', :gender => 'male', :age => 25, :school => 'School 5', :grade => 'U1', :time_slot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => false},
	
	{:user_id => User.find(3).id, :firstname => 'Hua', :lastname => 'Wang', :phone => '9796760003', :email => 'user3@tamu.edu', :gender => 'female', :age => 20, :school => 'School 6', :grade => 'U3', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true}
]

mentors.each do |mentor|
  Mentor.create!(mentor)
end


parents = [
	{:user_id => User.find(1).id, :firstname => 'Lei', :lastname => 'Li', :phone => '9796760001', :email => 'user1@tamu.edu'},
	
	{:user_id => User.find(4).id, :firstname => 'Ming', :lastname => 'Xiao', :phone => '9796760004', :email => 'user4@tamu.edu'},
	
	{:user_id => User.find(5).id, :firstname => 'Ritian', :lastname => 'Zhao', :phone => '9796760005', :email => 'user5@tamu.edu'},
	
	{:user_id => User.find(6).id, :firstname => 'Liangchen', :lastname => 'Ye', :phone => '9796760006', :email => 'user6@tamu.edu'}
]

parents.each do |parent|
  Parent.create!(parent)
end


groups = [
	{:title => 'group 1', :admin_id => Parent.find(1).id, :mentor_id => Mentor.find(1).id, :time_slot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => true},
	
	{:title => 'group 2', :admin_id => Parent.find(2).id, :mentor_id => Mentor.find(2).id, :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true}
]

groups.each do |group|
  Group.create!(group)
end


children = [
	{:parent_id => Parent.find(1).id, :firstname =>'Alei', :lastname => 'Lei', :gender => 'male', :age => 5, :school => 'School 1', :grade => 'G1', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST', 'FIRST'], :description => '...', :visible => true, :group_id => Group.find(1).id },
	
	{:parent_id => Parent.find(1).id, :firstname =>'Haha', :lastname => 'Oh', :gender => 'female', :age => 7, :school => 'School 2', :grade => 'G1', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true, :group_id => Group.find(2).id },
	
	{:parent_id => Parent.find(1).id, :firstname =>'Yeh', :lastname => 'Yeh', :gender => 'male', :age => 3, :school => 'School 1', :grade => 'G2', :time_slot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => false, :group_id => Group.find(1).id },
	
	{:parent_id => Parent.find(2).id, :firstname =>'Heihei', :lastname => 'Hei', :gender => 'female', :age => 5, :school => 'School 2', :grade => 'G2', :time_slot => '12:00 - 13:00 Mon', :competitions => ['BEST', 'FIRST'], :description => '...', :visible => true, :group_id => Group.find(2).id },
	
	{:parent_id => Parent.find(2).id, :firstname =>'Hehe', :lastname => 'Le', :gender => 'male', :age => 7, :school => 'School 1', :grade => 'G2', :time_slot => '12:00 - 13:00 Mon', :competitions => [], :description => '...', :visible => false}
]

children.each do |child|
  Child.create!(child)
end


invitations = [
	{:group_id => Group.find(2).id, :sender_id => Child.find(1).id, :receiver_id => Child.find(4).id, :status => 'pending'},

	{:group_id => Group.find(1).id, :sender_id => Child.find(5).id, :receiver_id => Child.find(2).id, :status => 'declined'}
]

invitations.each do |invitation|
  Invitation.create!(invitation)
end
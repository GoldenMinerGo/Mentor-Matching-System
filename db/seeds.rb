# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
parents = [
	{:username => 'user1', :password => 'GSetrdVGt', :role => 'parent', :firstname => 'Lei', :lastname => 'Li', :phone => '9796760001', :email => 'user1@tamu.edu'},
	
	{:username => 'user2', :password => 'g3fw4f43rf', :role => 'mentor', :firstname => 'Meimei', :lastname => 'Han', :phone => '9796760002', :email => 'user2@tamu.edu'},
	
	{:username => 'user3', :password => 'TrrtVDttv', :role => 'mentor', :firstname => 'Hua', :lastname => 'Wang', :phone => '9796760003', :email => 'user3@tamu.edu'},
	
	{:username => 'user4', :password => 'TbRSTVStf', :role => 'parent', :firstname => 'Ming', :lastname => 'Xiao', :phone => '9796760004', :email => 'user4@tamu.edu'},
	
	{:username => 'user5', :password => 'g3fw4f43rf', :role => 'parent', :firstname => 'Ritian', :lastname => 'Zhao', :phone => '9796760005', :email => 'user5@tamu.edu'},
	
	{:username => 'user6', :password => 'TrrtVDttv', :role => 'parent', :firstname => 'Liangchen', :lastname => 'Ye', :phone => '9796760006', :email => 'user6@tamu.edu'}
]

children = [
	{:parentid => 1, :firstname =>'', :lastname => '', :gender => true, :age => 5, :school => 'School 1', :grade => 'G1', :timeslot => '12:00 - 13:00 Mon', :competitions => ['BEST', 'FIRST'], :description => '...', :visible => true},
	
	{:parentid => 1, :firstname =>'', :lastname => '', :gender => false, :age => 7, :school => 'School 2', :grade => 'G1', :timeslot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true},
	
	{:parentid => 1, :firstname =>'', :lastname => '', :gender => true, :age => 3, :school => 'School 1', :grade => 'G2', :timeslot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => false},
	
	{:parentid => 5, :firstname =>'', :lastname => '', :gender => false, :age => 5, :school => 'School 2', :grade => 'G2', :timeslot => '12:00 - 13:00 Mon', :competitions => ['BEST', 'FIRST'], :description => '...', :visible => true},
	
	{:parentid => 5, :firstname =>'', :lastname => '', :gender => true, :age => 7, :school => 'School 1', :grade => 'G2', :timeslot => '12:00 - 13:00 Mon', :competitions => [], :description => '...', :visible => false}
]

groups = [
	{:title => 'title1', :adminId => 1, :mentorId => 0, :childrenId => [1,3], :competitions => ['FIRST'], :description => '...', :visible =>true},
	
	{:title => 'title2', :adminId => 2, :mentorId => 2, :childrenId => [2,4], :competitions => ['BEST'], :description => '...', :visible =>true}
]


mentors = [
	{:gender => true, :age => 25, :school => 'School 5', :grade => 'U1', :timeslot => '12:00 - 13:00 Mon', :competitions => ['FIRST'], :description => '...', :visible => false},
	{:gender => false, :age => 20, :school => 'School 6', :grade => 'U3', :timeslot => '12:00 - 13:00 Mon', :competitions => ['BEST'], :description => '...', :visible => true}
]

invitations = [
	{:groupId => 2, :senderId => 2, :receiverId => 5, :status => 'pending'},
	{:groupId => 1, :senderId => 1, :receiverId => 5, :status => 'decline'}
]

parents.each do |parent|
  Parent.create!(parent)
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
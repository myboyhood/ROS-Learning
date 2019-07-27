#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from msgandsrv.msg import Num

def Pub():
	pub1 = rospy.Publisher('hello_string',String,queue_size = 10)
	pub2 = rospy.Publisher('number',Num,queue_size = 10)
	rospy.init_node('msg_pub_node',anonymous = True)
	rate = rospy.Rate(10)

	hello_string = String()
	number = Num()

	while not rospy.is_shutdown():
		hello_string ="hello"
		number.num = 16
		pub1.publish(hello_string)
		pub2.publish(number)
		rate.sleep()

if __name__ == '__main__':
	try:
		Pub()
	except rospy.ROSInterruptException:
		pass


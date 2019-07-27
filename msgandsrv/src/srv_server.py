#!/usr/bin/env python

import rospy
from msgandsrv.srv import *


def handle_add_two_ints(req):
    print "return [%s + %s = %s]" % (req.a,req.b,(req.a + req.b))
    return Srv_testResponse(req.a+req.b)

def add_two_ints_server():
    rospy.init_node('server_node',anonymous = True)
    s = rospy.Service('add_two_ints',Srv_test,handle_add_two_ints)
    print "ready to add two ints"
    rospy.spin()

if __name__ == '__main__':
    try:
        add_two_ints_server()
    except rospy.ROSInterruptException:
        pass


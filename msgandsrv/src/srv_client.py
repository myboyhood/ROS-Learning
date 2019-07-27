#!/usr/bin/env python
import sys
import rospy
from msgandsrv.srv import *

def add_two_ints_client(x,y):
    try:
        rospy.wait_for_service('add_two_ints')
        add_approach = rospy.ServiceProxy('add_two_ints',Srv_test)
        resp1 = add_approach(x,y)
        return resp1.result
    except rospy.ROSInterruptException,e:
        print "service called failed:%s"%e



def usage():
    return "%s [x  y]"%sys.argv[0]

if __name__ == '__main__':
    if len(sys.argv) == 3:
        x = int(sys.argv[1])
        y = int(sys.argv[2])
    else:
        print usage()
        sys.exit(1)
    print "request add %s and %s" % (x,y)
    print "the result is %s" % add_two_ints_client(x,y)



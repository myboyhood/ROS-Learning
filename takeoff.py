#!/usr/bin/env python

import rospy
from geometry_msgs.msg import PoseStamped
from mavros_msgs.srv import CommandBool,CommandBoolRequest,CommandBoolResponse
from mavros_msgs.srv import SetMode,SetModeRequest,SetModeResponse
from mavros_msgs.msg import State

class Takeoff:
    def __init__(self):
        self.pose = PoseStamped()
        self.pose.pose.position.x = 0
        self.pose.pose.position.y = 0
        self.pose.pose.position.z = 3

        self.current_state = State()

    def state_cb(self, msg):
        self.current_state = msg

    def uav_takeoff(self):
        rospy.init_node('takeoff', anonymous=True)
        rospy.Subscriber('mavros/state', State, self.state_cb, queue_size=10)
        local_pose_pub = rospy.Publisher('mavros/setpoint_position/local', PoseStamped, queue_size=150)
        arming_client = rospy.ServiceProxy('mavros/cmd/arming', CommandBool)
        setmode_client = rospy.ServiceProxy('mavros/setmode', SetMode)

        rate = rospy.Rate(20.0)
        rate.sleep()
        # print 1

        # wait for FCU connected
        while (not rospy.is_shutdown()) and (not self.current_state.connected):
            rate.sleep()
            # print 2

        for i in range(100):
            if not rospy.is_shutdown():
                local_pose_pub.publish(self.pose)
                rate.sleep()
                # print i

        takeoff_set_mode = SetModeRequest()
        takeoff_set_mode.base_mode = 0
        takeoff_set_mode.custom_mode = "OFFBOARD"

        arm_cmd = CommandBoolRequest()
        arm_cmd.value = True

        last_request = rospy.get_rostime()
        rospy.wait_for_service('mavros/setmode')
        while not rospy.is_shutdown():
            if self.current_state.mode != "OFFBOARD" and (rospy.get_rostime() - last_request) > rospy.Duration(3):
                if setmode_client.call(takeoff_set_mode).mode_sent:
                    rospy.loginfo("offboard enabled")
                last_request = rospy.get_rostime()
            else:
                if (not self.current_state.mode) and (rospy.get_rostime()-last_request) > rospy.Duration(3):
                    if arming_client.call(arm_cmd).success:
                        rospy.loginfo("Vehicle armd")
                    last_request = rospy.get_rostime()

            local_pose_pub.publish(self.pose)
            # rospy.spin()
            rate.sleep()


if __name__ == "__main__":
    try:
        uav = Takeoff()
        uav.uav_takeoff()
    except rospy.ROSInterruptException:
        pass





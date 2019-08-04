#!/usr/bin/env python

import rospy
from geometry_msgs.msg import PoseStamped
from mavros_msgs.srv import CommandBool,CommandBoolRequest,CommandBoolResponse
from mavros_msgs.srv import SetMode,SetModeRequest,SetModeResponse
from mavros_msgs.msg import State
from nav_msgs.msg import Odometry
class Takeoff:
    def __init__(self):
        self.pose = PoseStamped()
        self.pose.pose.position.x = 0
        self.pose.pose.position.y = 0
        self.pose.pose.position.z = 1

        self.current_state = State()
        self.current_odometry = Odometry()

        self.waypoint_x = 0
        self.waypoint_y = 0
        self.waypoint_z = 1
        self.sequence = 0

    def state_cb(self, msg):
        self.current_state = msg

    def odometry_cb(self, data):
        self.current_odometry = data

    def set_newpoint(self, x, y, z):
        self.pose.pose.position.x = x
        self.pose.pose.position.y = y
        self.pose.pose.position.z = z

    def get_waypoint(self, sequence, number_of_points):

        point1 = rospy.get_param('/takeoff/waypoint/point1')
        point2 = rospy.get_param('/takeoff/waypoint/point2')
        point3 = rospy.get_param('/takeoff/waypoint/point3')
        point4 = rospy.get_param('/takeoff/waypoint/point4')
        point5 = rospy.get_param('/takeoff/waypoint/point5')
        waypoints = [point1, point2, point3, point4, point5]

        sequence = min(sequence, number_of_points)
        self.waypoint_x = waypoints[sequence-1][0]
        self.waypoint_y = waypoints[sequence-1][1]
        self.waypoint_z = waypoints[sequence-1][2]

        print waypoints
        print "reaching setpoint:" + str([self.waypoint_x, self.waypoint_y, self.waypoint_z])

    def uav_takeoff(self):
        rospy.init_node('takeoff', anonymous=True)

        rate = rospy.Rate(20.0)
        rate.sleep()

        rospy.Subscriber('mavros/state', State, self.state_cb)
        local_pose_pub = rospy.Publisher('mavros/setpoint_position/local', PoseStamped, queue_size=150)
        rospy.Subscriber('mavros/odometry/in',Odometry,self.odometry_cb)

        arming_client = rospy.ServiceProxy('mavros/cmd/arming', CommandBool)
        setmode_client = rospy.ServiceProxy('mavros/set_mode', SetMode)

        # rospy.spin()

        # print 1

        # wait for FCU connected
        while (not rospy.is_shutdown()) and (not self.current_state.connected):
            rate.sleep()
            # print 2

        # for i in range(100):
        #     if not rospy.is_shutdown():
        #         local_pose_pub.publish(self.pose)
        #         rate.sleep()
        #         print i

        local_pose_pub.publish(self.pose)
        takeoff_set_mode = SetModeRequest()
        takeoff_set_mode.base_mode = 0
        takeoff_set_mode.custom_mode = "OFFBOARD"

        arm_cmd = CommandBoolRequest()
        arm_cmd.value = True

        last_request = rospy.get_rostime()
        rospy.wait_for_service('mavros/set_mode')

        # print 3
        # print self.current_state.connected
        # print self.current_state.mode




        while not rospy.is_shutdown():
            if self.current_state.mode != "OFFBOARD" and (rospy.get_rostime() - last_request) > rospy.Duration(3):
                if setmode_client.call(takeoff_set_mode).mode_sent:
                    rospy.loginfo("offboard enabled")
                last_request = rospy.get_rostime()
                print self.current_state.mode
            else:
                if (not self.current_state.armed) and (rospy.get_rostime()-last_request) > rospy.Duration(3):
                    if arming_client.call(arm_cmd).success:
                        rospy.loginfo("Vehicle armd")
                    last_request = rospy.get_rostime()

            # tf axis has problem ,odo_x for setpoint_y and odo_y for setpoint_x
            error_x = abs(self.current_odometry.pose.pose.position.y - self.pose.pose.position.x)
            error_y = abs(self.current_odometry.pose.pose.position.x - self.pose.pose.position.y)
            error_z = abs(-self.current_odometry.pose.pose.position.z - self.pose.pose.position.z)
            error_sum = abs(error_x) + abs(error_y) + abs(error_z)

            if error_sum < 0.5:
                print "get point"+" "+str([self.pose.pose.position.x, self.pose.pose.position.y, self.pose.pose.position.z])

                self.sequence += 1
                self.get_waypoint(self.sequence, 5)
                self.set_newpoint(self.waypoint_x, self.waypoint_y, self.waypoint_z)
                for n in range(60): # delay 3.0s
                    local_pose_pub.publish(self.pose)
                    rate.sleep()
            elif error_sum >= 0.5:
                local_pose_pub.publish(self.pose)

            rate.sleep()


if __name__ == "__main__":
    try:
        uav = Takeoff()
        uav.uav_takeoff()
    except rospy.ROSInterruptException:
        pass





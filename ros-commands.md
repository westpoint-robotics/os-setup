# ROS Commands Summary
If you are looking for a consolidated 'Cheat Sheet', the pdf is [here](https://github.com/westpoint-robotics/os-setup/blob/master/ROScheatsheet.pdf).
Below are a list of simple ROS(Indigo Igloo) commands with a description on their function.

### Setting up your environment
- You must [setup your environment](http://wiki.ros.org/ROS/Tutorials/MultipleMachines) to use ROS on multiple machines.
1. ROS_MASTER_URI : Set the address of the robot.
- `export ROS_MASTER_URI=http://<robot ip>:11311/`
2. ROS_HOSTNAME : Should be set to the PC you are as the workstation.
- `export ROS_HOSTNAME=<workstation IP>`

### Writing Programs
1. roscd : Changes directory to the location of the specified ROS package
- `roscd <package name>`
2. rossrv : show <package name/service type>: dump the given service definition to the terminal
- `rossrv [show, ...]`
3. rosmsg : show <package name/message type>: dump the given message definition to the terminal
- `rosmsg [show, ...]`

### Running Programs
1. rosrun : Runs the given node from the given package. Equivalent to roscd <package name>/bin && ./<executable name> [<arg1>, <arg2>, ...]
- `rosrun <package name> <executable name> [<arg1>, <arg2>, ...]`
2. roscore : starts up a roscore node which provides the /rosout topic, among others
- `roscore`
3. roslaunch : Roslaunch is used to start a group of nodes with specific topics and parameters. It first checks for a roscore also known as the ros master and checks to see if it is running. Roslaunch will start roscore if one is not found. Then the Launch file runs all of the nodes within the launch file. See also [http://wiki.wpi.edu/robotics/ROS_File_Types ROS Launch File type]
- `roslaunch <launch folder or package name> <launch file>`

### Inspecting & Troubleshooting 
1. rostopic ...
- `list` : shows current ROS topics.
- `info <topic name>` : shows the nodes connected to the given topic.
- `echo <topic name>` : displays the raw data being sent on the given topic.
- `pub <topic name> <ROS message type> [<arg2>, <arg3>, ...]` : publishes the given data on the given topic.

2. rosservice ...
- `list` : show current ROS services
- `call <topic name> <ROS service type> [<arg2>, <arg3>, ...]` : make a service call to the given topic using the given service type.

3. rosnode
- If you are not sure if your node has initialized properly, or is subscribing/publishing to a topic you think it should be, you can use this tool to examine it.  This tool will also show you all active nodes, so if your node has died you can find out by using this.

4. [roswtf](http://wiki.ros.org/ROS/Tutorials/Getting%20started%20with%20roswtf)
- This is THE debugging tool in ROS. roswtf will scan your packages, environment, and configurations and come up with every possible reason why your program might not be working.  It is a bit of an information overload, but with patience you can find most of the flaws using this tool.

//Pratheek 09/18/17

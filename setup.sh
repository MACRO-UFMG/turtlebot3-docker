
for dir in turtlebot3/ros_ws/src/turtlebot3_simulations/; do
    echo Cloning submodules at \"$dir\"...
    cd $dir
    git submodule init
    git submodule update --recursive
    cd -
    echo 
done

docker compose build
docker compose run turtlebot3-ros2 bash -c "cd ros_ws && colcon build --symlink-install"
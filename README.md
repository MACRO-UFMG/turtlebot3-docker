# turtlebot3-docker

In this guide, you will set up your computer to run our ROS2 Turtlebot3 image.

## Requirements

To start, install the [Docker](https://docs.docker.com/engine/install/) engine.

> [!NOTE]
> To manage Docker as non-root user follow the steps in https://docs.docker.com/engine/install/linux-postinstall/

## Setup the Environment
We have already prepared everything you need to run in our `setup.sh`, so you can just run it with
```bash
./setup.sh
```
In just a few lines, it essentially clones the git submodules, build the docker images, and compiles the crazyswarm ros workspace.

## Usage
Run the desired service `docker compose` CLI.

```bash
docker compose up <service>
```

Services:
- turtlebot3-ros2 (WIP)

Rremove stopped containers with
```bash
docker compose down
```

## Running Turtlebot3

To access the container run
```bash
docker exec -it turtlebot3-ros2 bash
```

> [!WARNING]
> To enable your computer to run the environment with graphic support, you must give access for docker applications to your screen with:
> ```bash
> xhost +"local:docker@"
> ```

Then, run
```bash
ros2 launch turtlebot3_gazebo empty_world.launch
```
You'll see the gazebo world with a TurtleBot3 in it. Now, explore the packages and build your own applications, enjoy!

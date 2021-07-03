start_server()
{
    echo "Starting server ..................."
    /opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/startServer.sh $SERVER_NAME
}

stop_server()
{
    echo "Stopping server ..................."
    kill -s INT $PID
}

echo "Setting Password"
/tmp/work/set_password.sh
start_server
PID=$(ps -C java -o pid= | tr -d " ")
echo "Applying configuration"
if [ ! -z "$1" ]; then
    /tmp/work/run_py_script.sh "$@"
elif [ ! -z "$(ls /tmp/work)" ]; then
    echo "+ Found config-files under /tmp/work/config. Executing..."
    find /tmp/work -name "*.py"  -print0 | sort -z | xargs -0 -n 1 -r /tmp/work/run_py_script.sh
fi
/tmp/work/applyConfig.sh
stop_server
find /opt/IBM -user was ! -perm -g=w -print0 | xargs -0 -r chmod g+w
find /opt/IBM -type d -user was ! -perm -g=x -print0 | xargs -0 -r chmod g+x

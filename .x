case "$1" in
e)	vi -p Dockerfile docker-compose.yml;;
b)	./build.bash;;
s)	./shell.bash;;
"")	./launch.bash;;
esac

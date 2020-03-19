#sudo dnf install -y python3-devel harfbuzz-devel zlib-devel libpng-devel freetype-devel fontconfig-devel libXcursor-devel libXrandr-devel glfw-devel libXinerama-devel libxkbcommon-x11-devel mesa-libGL-devel libXi-devel wayland-devel python3-sphinx dbus-devel gcc libcanberra-devel
cd ~/repos/kitty && git pull --autostash --prune --rebase && \
python3 setup.py linux-package && \
sudo cp -r linux-package/* /usr/local

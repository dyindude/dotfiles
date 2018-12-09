if [ -x "$(command -v nvidia-settings)" ]; then
    nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=60"
fi

#!/bin/bash
#
# 系统时钟源
# ====================================== 
# Author : king  
# Date   : 2018-4-18     
# 参考：http://pzemtsov.github.io/2017/07/23/the-slow-currenttimemillis.html
# ====================================== 
# 查看当前时钟源
cat /sys/devices/system/clocksource/clocksource0/current_clocksource

# 查看有效的时钟源
cat /sys/devices/system/clocksource/clocksource0/available_clocksource

# 设置时钟源 kvm-clock tsc acpi_pm
echo tsc > /sys/devices/system/clocksource/clocksource0/current_clocksource

echo tsc > /sys/devices/system/clocksource/clocksource0/available_clocksource
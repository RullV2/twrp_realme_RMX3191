#!/system/bin/sh

    clear
    echo Activating High Performance Mode
    echo Warning! This mode will give best gaming experience and your phone might be heating up unforeseen consequences
    echo Do with your own risks
    echo
    
	# GED Modules
	echo 1 >/sys/module/ged/parameters/gx_game_mode
	echo 1 >/sys/module/ged/parameters/gx_force_cpu_boost
	echo 1 > /sys/module/ged/parameters/boost_amp
	echo 1 > /sys/module/ged/parameters/boost_extra
	echo 1 > /sys/module/ged/parameters/boost_gpu_enable
	echo 1 > /sys/module/ged/parameters/enable_cpu_boost
	echo 1 > /sys/module/ged/parameters/enable_gpu_boost
	echo 1 > /sys/module/ged/parameters/enable_game_self_frc_detect
	echo 10 > /sys/module/ged/parameters/gpu_idle
	echo 100 > /sys/module/ged/parameters/cpu_boost_policy
	echo 0 > /sys/module/ged/parameters/ged_force_mdp_enable
	echo 1 > /sys/module/ged/parameters/ged_boost_enable
	echo 100 > /sys/module/ged/parameters/ged_smart_boost
	echo 1 > /sys/module/ged/parameters/gx_frc_mode
	echo 1 > /sys/module/ged/parameters/gx_boost_on
	echo GED Modules enabled
	echo
	
	# CPU mode
	echo CPU Mode
	echo 3 > /proc/cpufreq/cpufreq_power_mode
	cat /proc/cpufreq/cpufreq_power_mode
	echo 1 > /proc/cpufreq/cpufreq_cci_mode
	cat /proc/cpufreq/cpufreq_cci_mode
	echo
	
	# Sched
	echo Kernel mode
	echo 0 > /sys/devices/system/cpu/eas/enable
    cat /sys/devices/system/cpu/eas/enable
	echo
	
    # Scheduler I/O
    echo Scheduler I/O 
    echo deadline > /sys/block/mmcblk0/queue/scheduler
    cat /sys/block/mmcblk0/queue/scheduler
    echo
	
	# increase performance
    echo Performance
	echo 1 > /sys/devices/system/cpu/perf/enable
    cat /sys/devices/system/cpu/perf/enable
    echo
	
	# GPU frequency
	echo Lock GPU Frequency
	echo 1800000 > /proc/gpufreq/gpufreq_opp_freq
	cat /proc/gpufreq/gpufreq_opp_freq | cut -d, -f1
	echo
	
	# GPU Power Policy
	echo GPU Power Policy
	echo 1 > /proc/mali/always_on
	cat /proc/mali/always_on
	echo always_on > /sys/devices/platform/13040000.mali/power_policy
	cat /sys/devices/platform/13040000.mali/power_policy
	echo
	
	echo Disable Throttle Thermal
	echo Warning! Your phone might be exploded
	echo The highest CPU temp can be reached up to 86°C
	echo The highest Battery temp can be reached up to 50°C
	stop thermal
    echo

	# PPM
    echo PPM :
	echo 1 > /proc/ppm/enabled
	echo 0 0 > /proc/ppm/policy_status
	echo 1 1 > /proc/ppm/policy_status
	echo 2 0 > /proc/ppm/policy_status
	echo 3 0 > /proc/ppm/policy_status
	echo 4 0 > /proc/ppm/policy_status
	echo 5 0 > /proc/ppm/policy_status
	echo 6 1 > /proc/ppm/policy_status
	echo 7 1 > /proc/ppm/policy_status
	echo 8 0 > /proc/ppm/policy_status
	echo 9 1 > /proc/ppm/policy_status
	cat /proc/ppm/policy_status
	echo
	
	# Governor
	echo Governor:
	echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
	echo performance > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
	cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
	echo
    
	# CPU frequency
	# big cluster
	echo Lock big CPU to 2000MHz
	echo 1 2000000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 1 2000000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq

	# LITTLE cluster
	echo Lock LITTLE CPU to 2000MHz
	echo 0 2000000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 0 2000000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq
	echo
	
	# Game Touch Sampling
	echo Game Touch Sampling Boost enabled
	echo 1 > /proc/touchpanel/game_switch_enable
	
	# Fix Touch Screen
	echo Fix Touch Screen
	echo 1 > /proc/touchpanel/oplus_tp_direction
	echo 0 > /proc/touchpanel/oplus_tp_limit_enable
	echo
	
	# Disable CABC 
	echo Disable CABC Mode for best experience
	echo 0 > /sys/kernel/oppo_display/LCM_CABC
	echo
	
	# Disable some debugging
	echo 0 > /sys/kernel/ccci/debug

	# POWERHAL SPORT MODE
	echo Add some games to sport mode
	echo -e "com.mobile.legends\ncom.tencent.ig\ncom.miHoYo.GenshinImpact\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\ncom.maleo.bussimulatorid\n" > /data/vendor/powerhal/smart
	echo

	# Logcat
    echo Force stop logcat to reduce CPU hogging
    stop logd
    echo

    # TCP
    echo TCP Congestion Control
    echo cubic > /proc/sys/net/ipv4/tcp_congestion_control
    cat /proc/sys/net/ipv4/tcp_congestion_control
    echo Enable TCP low latency
    echo 1 > /proc/sys/net/ipv4/tcp_low_latency
    echo
    
    # VM
    echo Clear RAM Cache aggressive
    echo 4 > /proc/sys/vm/drop_caches

	# CPUStune
	echo Modify CPUStune
	
	# CPU Load settings
	echo 0-7 > /dev/cpuset/foreground/cpus
	echo 0-2 > /dev/cpuset/background/cpus
	echo 0-5 > /dev/cpuset/system-background/cpus
	echo 0-7 > /dev/cpuset/top-app/cpus
	echo 0 > /dev/cpuset/restricted/cpus
	
	# Realtime
	echo 0 > /dev/stune/rt/schedtune.boost
	echo 1 > /dev/stune/rt/schedtune.prefer_idle
	
	# Background
	echo 0 > /dev/stune/background/schedtune.util.max.effective
	echo 0 > /dev/stune/background/schedtune.util.min.effective
	echo 0 > /dev/stune/background/schedtune.util.max
	echo 0 > /dev/stune/background/schedtune.util.min
	echo 0 > /dev/stune/background/schedtune.boost
	echo 0 > /dev/stune/background/schedtune.prefer_idle
	
	# Foreground
	echo 1024 > /dev/stune/foreground/schedtune.util.max.effective
	echo 0 > /dev/stune/foreground/schedtune.util.min.effective
	echo 1024 > /dev/stune/foreground/schedtune.util.max
	echo 0 > /dev/stune/foreground/schedtune.util.min
	echo 0 > /dev/stune/foreground/schedtune.boost
	echo 1 > /dev/stune/foreground/schedtune.prefer_idle
	
	# Top-App
	echo 1024 > /dev/stune/top-app/schedtune.util.max.effective
	echo 0 > /dev/stune/top-app/schedtune.util.min.effective
	echo 1024 > /dev/stune/top-app/schedtune.util.max
	echo 0 > /dev/stune/top-app/schedtune.util.min
	echo 0 > /dev/stune/top-app/schedtune.boost
	echo 1 > /dev/stune/top-app/schedtune.prefer_idle
	
	# Global
	echo 0 > /dev/stune/schedtune.util.min
	echo 1024 > /dev/stune/schedtune.util.max
	echo 1024 > /dev/stune/schedtune.util.max.effective
	echo 0 > /dev/stune/schedtune.util.min.effective
	echo 0 > /dev/stune/schedtune.boost
	echo 1 > /dev/stune/schedtune.prefer_idle
	echo
	
	
	
	
	echo High Performance Mode is activated
	echo For best experience, please enable all CPU
	echo
	echo This script made by @ismasrull
	echo Last updated : 16:17 04/11/2023

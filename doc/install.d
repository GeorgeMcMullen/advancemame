Name{number}
	install - AdvanceMAME Installation

	This document describes the installation and configuration
	process of the Advance programs.

System Requirements
	To run the Advance programs you may need to install and
	configure some drivers and libraries on your system.

	The following is a list of all that you need.

	More details on the single drivers are present in the
	`advdev.txt' documentation file.

  Linux
	In Linux the Advance programs can run either in the
	X Window graphical environment or from the Linux Console.

	In X Window the SDL library is used for everything: video,
	audio and input controllers.

	In the Linux Console, the Linux Frambeuffer is used for the
	video, the ALSA or OSS library for audio, and the Linux Event
	interface for intput controllers.

	The video board programming functionality for Arcade Monitors
	and CRT TVs, is available only from the Linux console, using
	the Linux Framebuffer.

  Raspberry Pi
	With a Raspberry Pi you have the same support you have in Linux,
	plus some specific Raspberry functionalities, like the accelerated
	Framebuffer.

	With a Raspberry, it's recommended run the Advance program directly
	from Linux Console because using the Linux Framebuffer you get also
	hardware acceleration that is missing when run from the X Window system
	using the SDL library.

	In the default configuration the Advance programs automatically use
	this hardware acceleration to scale the image to the screen size.
	This is the best operating mode when using a modern monitor or flat TV,
	and with a Raspberry Pi 3 you can expect to run most of the games at
	full speed, even when using the Scale2x effect.

	If instead you want to use an old CRT Arcade screen or TV, you can
	configure the Advance programs to generate video modes customized
	for your video hardware.

	In this case see the following "Video Setup" chapter.

  Windows/Mac OS X
	The Advance programs contain a copy of the SDL library
	which allow them to work also in the Windows platform.

	The SDL library is also used for audio, and input controllers.

  DOS
	The Advance programs already contain all the required drivers
	for video, audio, and input controllers.

	Generally you don't need to install additional software with
	the exception of a mouse driver if you want to use one.

Installation
	The suggested way to installing the Advance programs is to start 
	from the sources.
	
	The build process is detailed in `build.txt' file, but generally 
	you need only the usual commands:

		:./configure
		:make
		:sudo make install

	The exception is the DOS and Windows target. In this case it's 
	better to start from the binary distribution and don't compile 
	the source.

Configuration
	All the Advance programs require a configuration process to work
	correctly.

	A default configuration file is created by the programs when they
	are started for the first time.

	In Linux, Raspbian, Mac OS X and other Unix, the configuration file is
	created in the user home directory in the subdirectory .advance/. 
	In DOS and Windows the configuration file is created in the 
	current directory.

	When you have finished to modify the configuration file,
	it's suggested to run the program with the `-remove' option
	to remove all the default configuration options from the
	configuration file.

  AdvanceMAME
	To run AdvanceMAME you need at least to set the `dir_rom' option 
	to the path there the roms resides.

	If you want to run it as standard applications in a Window 
	Manager environment like X Window, Windows or Mac OS X Acqua, 
	you don't need to configure any video options. Instead, if you 
	want to enable the direct programming of the video board
	you need to carefully follow the "Video Setup" chapter
	in this file.

  AdvanceMENU
	To run AdvanceMENU you need to configure which emulator is
	present in your system. If a known emulator is found, it's 
	configured automatically. In Linux and Mac OS X the 
	emulators are searched in the current PATH list, in DOS and 
	Windows only in the current directory.

	Generally you need also to adjust the path where the
	game's .png, .mp3 and .mng files reside with the
	emulator_* options.

Video Hardware
	The Advance programs are able to drive different types
	of video hardware: LCD, Multi Sync monitors, Fixed
	Sync monitors, Arcade monitors and CRT TVs.

	With the exception of PC Monitors that always accept the
	VGA signal, for other monitors you should take in account
	the required video signals and eventually use conversion
	circuits to adapt signals.

	A lot of useful links are available on the AdvanceMAME video
	link page:

		+http://www.advancemame.it/video-link.html

  LCD monitors or LCD TVs
	LCD screens have always a native fixed resolution. To get the
	best image quality it's always recomended to use this resolution.

	For this reason you usually don't need to enter any specific
	configuration options, and let the program to use the default
	video mode.

	This mode of operation is the default when you are in
	a graphics environment like X, Windows and Mac OS X.

  Multi Sync monitors (or CRT PC monitors)
	Multi Sync monitors support a wide range of horizontal clocks
	and requires a standard VGA connector. They are the normal PC
	monitors.

	With PC monitors you can choose to work without any configuration,
	using only the default video mode, like a LCD screen, or configure
	the clocks supported to allow a direct video mode generation
	by the Advance programs.

	You can generally find the range of clocks supported in the
	monitor manual, generic values are:

		:device_video_clock 10 - 150 / 30.5 - 60 / 55 - 130

  Fixed Sync Monitors
	Fixed Sync monitors support only a few fixed horizontal clocks.
	Generally they requires separate 3,4 or 5 BNC connectors, with
	the exception of old VGA monitors which requires a standard
	VGA connector.

	You must find the exact clocks supported in the monitor manual.

	The standard clocks for VGA monitors are:

		:device_video_clock 10 - 50 / 31.5 / 55 - 130

	If the monitor uses separate H/V sync signals you can
	directly use the VGA sync signals of your PC. If the monitor
	uses composite sync, or sync-on-green you must use a sync
	converter circuit.
  
	These monitors are generally compatible with the VGA video
	signal level of 0.7 V p-p.
 
  Arcade Monitors
	Arcade monitors support only a few fixed horizontal and
	vertical clocks, generally the horizontal are 15.75 and 25 kHz,
	and the vertical 60 Hz.

	You must find the exact clocks supported in the monitor
	manual.

	Please note that the manuals of some Arcade Monitors
	incorrectly state a wide range of horizontal frequency
	like 15 - 31 kHz. Generally these monitors support only
	the three fixed clocks of 15.75, 25, 31.1 kHz. An example
	is the Wells-Gardner D9200.
  
	The standard clocks for a Standard Resolution 15 kHz (CGA) are:

		:device_video_clock 5 - 50 / 15.75 / 60

	for a Extended Resolution 16 kHz are:

		:device_video_clock 5 - 50 / 16.5 / 53

	for a Medium Resolution 25 kHz (EGA) are:

		:device_video_clock 5 - 50 / 25 / 60

	If your monitor is multistandard, you can use more
	clock specification separating them with the `;' char.

	For example:

		:device_video_clock 5 - 50 / 15.75 / 60 ; 5 - 50 / 25 / 60

	If the monitor accepts separate H/V sync signals at
	levels 0 - 5 V you can directly use the VGA sync signal of
	your PC. If the monitor uses another sync signal you must
	use a sync conversion circuit.

	If the monitor accepts a composite sync signal, instead of
	using a sync conversion circuits you can also try twisting
	the two H and V VGA signal together. It works if you select
	VGA negative H and V sync on the programs. To be on safe side
	I DO NOT RECOMMEND THIS HACK to connect sync signals directly
	together. Technically you should never just tie sync
	signal lines together. They are not usually designed for
	this, so this can damage your video card. If you try, use
	with caution.
  
	You must also ensure that the monitor accepts the VGA video
	signal level of 0.7 V p-p. Generally arcade monitors require a
	video signal between 1 V and 5 V for each line.
	Therefore if you attempt to drive an arcade monitor with a
	VGA video signal you will at most, have a very dark picture with
	no contrast. You will need to buy/make an amplifier for each
	line in order for it to work.

  CRT TVs
	CRT TVs generally supports only two fixed combination of
	horizontal and vertical clocks, corresponding at the TV PAL
	and NTSC standards.

	Clocks values for PAL TV (European) are:

		:device_video_clock 5 - 50 / 15.62 / 50

	for NTSC TV (USA) are:

		:device_video_clock 5 - 50 / 15.73 / 60

	for PAL TV (European) which supports also NTSC TV (USA) modes
	(common if you use the SCART input):

		:device_video_clock 5 - 50 / 15.62 / 50 ; 5 - 50 / 15.73 / 60

    TVs with SCART
	If your TV has a SCART input, you can use directly the VGA 
	analog signal as RGB input.

	A composite sync signal is required. It means that you must
	use a sync converter circuit to convert the VGA H/V sync with
	levels 0 - 5 V to a composite sync of levels 0 - 0.3 V.

	The SCART input accepts also a composite video signal, but
	the RGB video is far superior.

	Remember what to enable the SCART RGB signal you must set
	the SCART pin 16 at level 1 - 3 V (no more than 3 V).
	And to automatically switch the TV to the AV signal you
	must set the SCART pin 8 at level 9.5 - 12 V (for some
	TVs 5 V may be enough).

	If you have a recent VGA board, you can use the 5 V power
	available on the VGA pin 9. Alternatively you can use the
	5 V and 12 V PC internal power.

    TVs with S-Video
	If your TV has a S-Video input, you can use the TV-Out signal
	of your VGA board.

	The quality of the S-Video signal is near at the quality of
	the RGB signal.

	Unfortunately the TV-Out signal is generally not enabled
	by the Advance programs. There are some external utilities
	for Linux and Windows able to enable the TV-Out signal,
	but their use is mainly untested.

Video Setup
	The Advance programs have the ability to directly control your video
	board to get the best possible fullscreen video modes with always the
	correct size and aspect ratio.

	This feature is available in Linux with the Frame Buffer drivers.
	The legacy SVGALIB support for Linux/Windows/DOS is still present,
	but likely too old to support your video board.

	To make it possible, the programs need some information on your
	monitor capability in the form of the supported pixel, horizontal
	and vertical clocks.

	With thies information the programs are able to always generate
	`perfect' video modes for the emulated game.

  Operation Modes
	The programs support two basic ways to generated video modes:
	the `automatic' and the `manual' operation mode.

	In the `automatic' mode the programs automatically generate
	a video mode from scratch. It's the simplest mode of operation.

	In the `manual' mode the programs pick the video mode from a
	manually defined list of modelines, eventually adjusting them
	to match the game clock or size requirements.
	This mode of operation should be used only if the `automatic'
	mode doesn't work.

    Automatic Operation Mode
	In the automatic operation mode the programs automatically
	create a `perfect' video mode for the game to be emulated
	that fit exactly the whole screen with the correct aspect
	and frame rate.

	To configure and activate this mode you need to run the
	`advcfg' utility for AdvanceMAME and `advcfg -advmenuc' for
	AdvanceMENU, and answer at the various questions.
	You don't need to create a list of video modes, any needed
	video mode is created at runtime.

	Before running the `advcfg' utility you should check your
	monitor manual for the vertical and horizontal clocks
	supported by your monitor.

	The `advcfg' utility adds these options in your `advmame.rc':

		:display_mode auto
		:display_adjust generate_yclock
		:device_video_clock ?
		:device_video_format ?

	All these options are documented in the `advdev.txt'
	and `advmame.txt' files.

    Manual Operation Mode
	In the manual operation mode the programs scan a list of `good'
	video modelines created manually and chose the best available.
	You must in advance create this list of video modelines with the
	`advv' utility.

	This is the description of the few basic steps required to run 
	the programs in the manual operation mode. All the options used 
	are documented in the `advdev.txt' file.

	) For AdvanceMAME add in the in the file `advmame.rc' these
		options:

		:display_mode auto
		:display_adjust x

	) Add in the file `advmame.rc' or `advmenu.rc' the
		`device_video_clock' option that specify which
		pixel, horizontal and vertical clocks are supported
		by your monitor.
		Generally these values are specified in the technical
		page of your monitor manual. You can see the
		"Video Hardware" chapter in this file for some
		examples.

	) Run the `advv' program for AdvanceMAME or `advv -advmenuv' for
		AdvanceMENU.

	) Test the video modelines of your interest pressing ENTER
		on them. If the mode isn't centered try centering it
		with the ARROW keys. When you have finished press ENTER
		to save your modifications or ESC to restore the
		previous setting.
		Returned in the video mode list, if the mode is
		displayed correctly, you can select it to be used by
		the programs pressing SPACE.
		It's very important that in all the selected modes
		the screen area is completely visible. Otherwise,
		when playing, part of the game may be out of screen.
		Video modes displayed in red aren't supported by
		your video hardware.

	) When you have selected the list of `good' video modes press
		F2 to save them in your configuration file.

	) Press ESC to exit from `advv'

	In the `contrib/modeline' dir are present some .rc file with
	some example modelines. The same modelines are contained in
	the `advv' program.

Copyright
	This file is Copyright (C) 2003 - 2016 Andrea Mazzoleni.


[2020 09 04 - Installation Day]
    - Installed via pacstrap: base, linux, linux-firmware, man-db, man-pages, texinfo, dosfstools, e2fsprogs, ntfs-3g, connman, wpa_supplicant, bluez, bluez-utils neovim;
    - Installed: grub, efibootmgr, os-prober, intel-ucode;
    - Added 1 GiB swapfile and decreased swappiness to 10;
    - Added pool.ntp.org to connman ethernet config;
    - Installed: htop, ldns(drill);
    - Installed: xdg-utils, perl-file-mimeinfo;
    - Added /data/common/shell/xdg_base_vars to import in .rc's and set XDG Base Directories;
    - Added /data/common/shell/xdg_app_vars to import in .rc's so some apps obey XDG specs;
    - Enabled fstrim.timer systemd unit;
    - Installed: mesa, lib32-mesa, xf86-video-amdgpu, vulkan-radeon, lib32-vulkan-radeon, libva-mesa-driver, lib32-libva-mesa-driver, mesa-vdpau, lib32-mesa-vdpau, xf86-video-intel, vulkan-intel, intel-media-driver, vulkan-mesa-layers, lib32-vulkan-mesa-layers, libva-vdpau-driver, libva-intel-driver, mesa-demos;
    - Installed: libva-utils, vdpauinfo;
    - Installed: sway, swaylock, swayidle, waybar;
    - Installed: xorg, xorg-xinit, i3, i3status-rust;
    - Installed: v4l-utils, xf86-input-libinput;
    - Installed: pulseaudio, pulseaudio-bluetooth, pulseaudio-alsa, pulseaudio-jack, pulseaudio-zeroconf, pavucontrol, pulseeffects;
        TODO: configure pulseeffects equalizer and mic noise cancelling;
    - Installed: termite, rofi;
    - Added user 'arthur' in groups 'wheel,log,adm,uucp,rfkill';
    - Added custom keyboard map to vconsole (/usr/local/share/kbd/keymaps/personal.map);
    - Installed: base-devel;
    - Added 'arthur' to sudoers, removed passphrase prompt timeout and increased password caching to 10 min;
    - Installed: openssh(explicit), gnupg(explicit), rsync, git;
    - Installed: firefox, thunderbird, vlc, ffmpeg;
    - Installed: libmtp, protobuf, libmicrodns(for chromecast in vlc);
    - Installed: mlocate, logrotate;
    - Installed: picom, feh;
    - Added xkb custom rules and symbols. Included in /usr/share/X11/xkb symbols/custom anc changed symbols/level5, rules/evdev.lsr and rules/evdev.xml;
        TODO: create a patch to apply modifications in system files;

[2020 09 05 - Config Day]
    - Installed: discord, steam, steam-native-runtime;
    - Installed: yay-bin, spotify;
    - Added boot messages, hid unless pressing shift and external keyboard support to GRUB;
    - Added video drivers to mkinitcpio early KMS start;
    - Commented out module-esound-protocol-unix.so from /etc/pulse/default.pa
    - Installed: chromium;
    - Installed: redshift-wayland-git;
    - Changed /etc/security/faillock.conf to only block for 1 minute after 6 wrong attempts;
    - Installed: maim grim slurp xclip wl-clipboard;
    - Added Xorg configs for keyboard, touchscreen and GPUs in /etc/X11/xorg.conf.d/;
    - Changed audio sinks priority in /usr/share/pulseaudil/alsamixer/paths;
    - Installed: thermald, cpupower;
    - Enabled thermald and cpupower services;
    - Installed: ttf-croscore, ttf-dejavu, gnu-free-fonts, ttf-ibm-plex, ttf-liberation, ttf-linux-libertine, noto-fonts, noto-fonts-cjk, noto-fonts-emoji, noto-fonts-extra, ttf-roboto, tex-gyre-fonts, tf-b612, ttf-fira-code, ttf-iosevka, ttf-mononoki, adobe-source-code-pro-fonts, ttf-anonymous-pro, ttf-courier-prime, ttf-andika, cantarell-fonts, inter-font, otf-jost, adobe-source-sans-pro-fonts, ttf-junicode, ttf-ancient-fonts, ttf-ubraille, ttf-sil-scheherazade, adobe-source-han-sans-otc-fonts, adobe-source-han-serif-otc-fonts, ttf-paratype, otf-gfs, ttf-joypixels, otf-openmoji, otf-cm-unicode, otf-latinmodern-math, otf-latin-modern, ttf-font-awesome, ttf-font-awesome-4, ttf-ionicons, powerline-fonts;
    - Installed: ttf-ms-win10(prepackaged);
        TODO: select subset to keep in future;
    - Installed: freetype2-cleartype;
    - Added user configuration to freetype and disabled bitmap font scaling;
        TODO: configure console fonts;
    - Changed 'gfx.font_rendering.fontconfig.max_generic_substitutions' and 'font.name-list.emoji' options in firefox;
    - Added gnome and kde packages and groups to pacman.conf ignore list;
    - Installed: lesspipe, catdoc, cdrtools, djvulibre, fastjar, ghostscript, python-html2text, imagemagick, mediainfo, odt2txt, p7zip, unrar, unzip;
    - Installed: udisks2;
    - Installed: tree;

[2020 09 06 - Config Day Pt 2]
    - NOTE: NEVER install pi-hole-standalone. Doesn't work;
    - Installed: pi-hole-server, php-intl, wget;
    - Enabled 2GB of available mem, sockets, sqlite3, lighttpd, php-cgi, pdo_sqlite and intl in /etc/php/php.ini;
    - Installed: pihole-updatelists(https://github.com/jacklul/pihole-updatelists);
    - Added dnsmasq.d config so pi-hole will filter enp1s0 and wlp2s0;
    - Changed connman general and ethernet config with local nameserver. Disabled connman DNS proxy with systemd rule (/etc/systemd/system/connman.service.d/disable_dns_proxy.conf). Set /etc/resolv.conf to 127.0.0.1;
    - Created empty file /etc/pihole/custom.list;
    - Created own gist with list of blocklists and added to /etc/pihole-updatelists.conf;
        TODO: create private gist with block and allow entries and regexes;
    - Installed: playerctl;
    - Installed: qjoypad;
        TODO: play with it;
    - Added udev rule to set dualshock led colors on startup (https://gaming.stackexchange.com/a/336936) and to disable motion sensor (https://wiki.archlinux.org/index.php/Gamepad#PlayStation_4_controller);
    - Installed: nftables, iptables-nft;
    - Added nftables ruleset and saved it in /etc/nftables.default;
    - Configured logrotate options and added /etc/logrotate.d/pacman;
        TODO: add more logs to be rotated;
    - Configured journald size limits in /etc/systemd/journald.conf;

[2020 09 07 - Config Day Pt 3]
    - Installed: i3ar-rs, ibus, cmst, blueman, ethtool, iw
    - Configured i3bar-rs;
    - Installed: xidlehook, betterlockscreen;
    - Enabled betterlockscreen@$USER.service in systemd;
    - Installed: pygtk, python-i3-py, dzen2, jq;
    - Added i3-exit script in .local/bin;
    - Installed: dunst;
    - Installed: vimiv;
    - Installed: rxvt-unicode (to deal with termite problems with arguments when using -e flag);
    - Installed: lsix, poppler;
    - Installed: ranger, ncdu, lftp, atool, fmpegthumbnailer, highligh, perl-image-exiftool, python-chardet, w3m;

[2020 09 08 - Config Day Pt 3]
    - Installed: unclutter;
    - Installed: strace;
    - Enhanced redshift_bright script;
    - Configured picom, rofi, urxvt and xterm;

[2020 09 09 - Config Day Pt 4]
    - Set "ui.context_menus.after_mouseup" to "true" in firefox to prevent going back to prior page on right mouse release;
    - Installed: llpp;
    - Installed: Bioshock Infinite, Postal 2, Borderlands 2, Hollow Knight, Broforce and Tabletop Simulator on Steam;
    - Configured tmux, autostarting using systemd user services in ~/.config/systemd/user/tmux.service;

[2020 09 10 - Config Day Pt 5]
    - Installed: xdg-user-dirs;
    - Changed defaults in ~/.config/user-dirs.dirs, /etc/xdg/user-dirs.defaults, and sourced /data/common/shell/xdg_user_base_dirs in .bash_profile;
    - Fixed home dotfiles;
    - Installed: libxft-bgra;
        TODO: reinstall st changing config.h;
        NOTE: urxvt, xterm and st won't work well with deadkeys. Going back to termite;

[2020 09 11 - Config Day Pt 6]
    - Installed: perl-file-mimeinfo, mimeo, xdg-utils-mimeo;
    - Installed: bash-completion;
    - Configured bash;
    - Configured nvim without plugins (only gruvbox);

[2020 09 13]
    - Installed: docker, pigz;
    - Installed: tig;

[2020 09 16]
    - Installed: libreoffice, lightworks, audacity, gimp, inkscape, pstoedit, python-lxml, python-numpy, scour, texlive-core;

[2020 09 20]
    - Installed: matlab, quartus, noisetorch;

[2020 09 25]
    - Installed: lshw;

[2020 09 30]
    - Configured bluetooth auto enable in '/etc/bluetooth/main.conf';

[2020 11 23]
    - Installed: xf86-input-wacom, xournalpp;
    - Added Wacom One tablet connfig in '/etc/X11/xorg.conf.d/70-wacom-one.conf';
    - Set wacom tablet to the left screen;
        TODO: Make script to set to primary screen;

[2020 12 20]
    - Installed: android-tools, android-udev, scrcpy, adb-sync-git;

[2020 12 23]
    - Removed local pi-hole;
    - Configured docker pi-hole;
    - Configured dnsmasq, nftables and virsh so virtualization and container networks work properly;

[2021 02 24]
    - Changed pulseaudio for pipewire;
    - Installed pipewire, pipewire-alsa, pipewire-pulse, gst-plugin-pipewire, pipewire-jack, pipewire-docs, realtime-privileges;


    TODO: implement .local/bin/monitorctl script;
    TODO: configure colors and missing glyphs in console;
    TODO: configure ssh and sshfs
    TODO: configure git;
    TODO: configure pgp;
    TODO: make my own gtk/qt groovebox theme (using oomox?);
    TODO: change less colorscheme


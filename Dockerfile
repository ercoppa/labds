FROM ursamajorlab/jammy-python:3.12.5
# python:3.12.5

RUN apt update && apt-get install -y bash-completion entr make git && apt clean

# playwright deps :(
RUN apt-get install -y --no-install-recommends libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libdbus-1-3 libdrm2 libgbm1 libglib2.0-0 libnspr4 libnss3 libpango-1.0-0 libwayland-client0 libx11-6 libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxrandr2 xvfb fonts-noto-color-emoji fonts-unifont libfontconfig1 libfreetype6 xfonts-cyrillic xfonts-scalable fonts-liberation fonts-ipafont-gothic fonts-wqy-zenhei fonts-tlwg-loma-otf fonts-freefont-ttf ffmpeg libcairo-gobject2 libdbus-glib-1-2 libgdk-pixbuf-2.0-0 libgtk-3-0 libpangocairo-1.0-0 libx11-xcb1 libxcb-shm0 libxcursor1 libxi6 libxrender1 libxtst6 libsoup-3.0-0 libenchant-2-2 gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good libicu70 libegl1 libepoxy0 libevdev2 libffi7 libgles2 libglx0 libgstreamer-gl1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgudev-1.0-0 libharfbuzz-icu0 libharfbuzz0b libhyphen0 libjpeg-turbo8 liblcms2-2 libmanette-0.2-0 libnotify4 libopengl0 libopenjp2-7 libopus0 libpng16-16 libproxy1v5 libsecret-1-0 libwayland-egl1 libwayland-server0 libwebpdemux2 libwoff1 libxml2 libxslt1.1 libx264-163 libatomic1 libevent-2.1-7 && apt clean

# playwright deps :(
# RUN apt update && apt-get install -y bash-completion libnss3\
#     libnspr4\
#     libdbus-1-3\ 
#     libatk1.0-0\ 
#     libatk-bridge2.0-0\
#     libcups2\
#     libdrm2\ 
#     libxkbcommon0\ 
#     libatspi2.0-0\ 
#     libxcomposite1\
#     libxdamage1\ 
#     libxfixes3\
#     libxrandr2\
#     libgbm1\ 
#     libasound2\
#     adwaita-icon-theme at-spi2-common dbus dbus-bin dbus-daemon dbus-session-bus-common dbus-system-bus-common dbus-user-session dconf-gsettings-backend dconf-service dictionaries-common dmsetup \
#     emacsen-common glib-networking glib-networking-common glib-networking-services gsettings-desktop-schemas gtk-update-icon-cache hunspell-en-us iso-codes libaa1 libapparmor1 libargon2-1 libasound2-data \
#     libaspell15 libass9 libasyncns0 libavahi-client3 libavahi-common-data libavahi-common3 libavc1394-0 libavcodec59 libavfilter8 libavformat59 libavutil57 libblas3 libbluray2 libbs2b0 libcaca0 libcap2-bin \
#     libcdparanoia0 libchromaprint1 libcjson1 libcodec2-1.0 libcolord2 libcryptsetup12 libdc1394-25 libdca0 libdconf1 libdecor-0-0 libdevmapper1.02.1 libdirectfb-1.7-7 libdrm-amdgpu1 libdrm-common \
#     libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdv4 libdvdnav4 libdvdread8 libdw1 libegl-mesa0 libfaad2 libfdisk1 libflac12 libflite1 libfluidsynth3 libfontenc1 libfreeaptx0 libgfortran5 libgl1 \
#     libgl1-mesa-dri libglapi-mesa libglvnd0 libglx-mesa0 libgme0 libgpm2 libgsm1 libgssdp-1.6-0 libgstreamer-plugins-bad1.0-0 libgtk-3-common libgupnp-1.6-0 libgupnp-igd-1.0-4 libhunspell-1.7-0 libhwy1 \
#     libiec61883-0 libinstpatch-1.0-2 libip4tc2 libjack-jackd2-0 libjson-c5 libjson-glib-1.0-0 libjson-glib-1.0-common libjxl0.7 libkate1 libkmod2 liblapack3 libldacbt-enc2 liblilv-0-0 libllvm15 liblrdf0 \
#     libltc11 libmbedcrypto7 libmfx1 libmjpegutils-2.1-0 libmodplug1 libmp3lame0 libmpcdec6 libmpeg2encpp-2.1-0 libmpg123-0 libmplex2-2.1-0 libmysofa1 libneon27 libnice10 libnorm1 libogg0 libopenal-data \
#     libopenal1 libopenh264-7 libopenmpt0 libopenni2-0 liborc-0.4-0 libpam-systemd libpciaccess0 libpgm-5.3-0 libplacebo208 libpocketsphinx3 libpostproc56 libpulse0 libqrencode4 librabbitmq4 libraptor2-0 \
#     librav1e0 libraw1394-11 librist4 librubberband2 libsamplerate0 libsbc1 libsdl2-2.0-0 libsecret-common libsensors-config libsensors5 libserd-0-0 libshine3 libshout3 libslang2 libsnappy1v5 libsndfile1 \
#     libsndio7.0 libsodium23 libsord-0-0 libsoundtouch1 libsoup-3.0-common libsoxr0 libspandsp2 libspeex1 libsphinxbase3 libsratom-0-0 libsrt1.5-gnutls libsrtp2-1 libssh-gcrypt-4 libsvtav1enc1 \
#     libswresample4 libswscale6 libsystemd-shared libsystemd0 libtag1v5 libtag1v5-vanilla libtext-iconv-perl libtheora0 libtwolame0 libudev1 libudfread0 libunwind8 libusb-1.0-0 libv4l-0 libv4lconvert0 \
#     libva-drm2 libva-x11-2 libva2 libvdpau1 libvidstab1.1 libvisual-0.4-0 libvo-aacenc0 libvo-amrwbenc0 libvorbis0a libvorbisenc2 libvorbisfile3 libvpx7 libvulkan1 libwavpack1 libwayland-cursor0 \
#     libwebrtc-audio-processing1 libwildmidi2 libx264-164 libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-sync1 libxcb-xfixes0 libxcb-xkb1 libxfont2 libxinerama1 \
#     libxkbcommon-x11-0 libxkbfile1 libxmu6 libxpm4 libxshmfence1 libxvidcore4 libxxf86vm1 libyajl2 libz3-4 libzbar0 libzimg2 libzmq5 libzvbi-common libzvbi0 libzxing2 ocl-icd-libopencl1 systemd\ 
#     systemd-sysv timgm6mb-soundfont x11-xkb-utils xfonts-encodings xfonts-utils xkb-data xserver-common \
#     fonts-freefont-ttf fonts-ipafont-gothic fonts-liberation fonts-noto-color-emoji fonts-tlwg-loma-otf fonts-unifont fonts-wqy-zenhei gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-good \
#     libdbus-glib-1-2 libenchant-2-2 libevdev2 libharfbuzz-icu0 libhyphen0 libmanette-0.2-0 libnotify4 libopengl0 libsecret-1-0 libwoff1 xfonts-scalable xvfb \
#     entr \
#     && apt clean

RUN apt install locales && apt clean
RUN locale-gen en_US.UTF-8

RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user
RUN echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc

ENV LC_CTYPE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

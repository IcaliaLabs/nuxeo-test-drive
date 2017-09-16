# Since ffmpeg contains some non-free codecs, ffmpeg is not included in the official images of nuxeo
# So, we'll use this Dockerfile instead, in which we will add it ourselves:
FROM nuxeo:9.2

USER root

RUN set -ex && \
  export BUILD_YASM=true && \
  export LIBFAAC=true && \
  export BUILD_PACKAGES='libfaac-dev git' && \
  export AUTO_ADDED_PACKAGES='' && \
  echo "deb http://httpredir.debian.org/debian jessie non-free" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends $BUILD_PACKAGES && \
  cd /tmp && \
  git clone https://github.com/nuxeo/ffmpeg-nuxeo.git && \
  cd ffmpeg-nuxeo && \
  ./prepare-packages.sh && \
  ./build-yasm.sh && \
  ./build-x264.sh && \
  ./build-libvpx.sh && \
  ./build-ffmpeg.sh && \
  cd /tmp && \
  rm -Rf ffmpeg-nuxeo && \
  apt-get remove --purge -y $BUILD_PACKAGES $AUTO_ADDED_PACKAGES && \
  rm -rf /var/lib/apt/lists/*

USER 1000

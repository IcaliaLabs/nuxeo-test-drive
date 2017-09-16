# Since ffmpeg contains some non-free codecs, ffmpeg is not included in the official images of nuxeo
# So, we'll use this Dockerfile instead, in which we will add it ourselves:
FROM nuxeo:9.2

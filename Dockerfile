FROM mongo:3.4

copy ./poststart.sh /

RUN chmod a+x /poststart.sh

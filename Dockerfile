FROM mongo:3.4

copy ./poststart.sh /usr/local/bin/poststart.sh
RUN chmod a+x /usr/local/bin/poststart.sh
copy ./start.sh /usr/local/bin/start.sh
RUN chmod a+x /usr/local/bin/start.sh

CMD ["sh","/usr/local/bin/start.sh"]

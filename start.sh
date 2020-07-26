#!/sh

poststart.sh

mongod --bind_ip 0.0.0.0 --replSet MainRepSet

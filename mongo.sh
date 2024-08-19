#!/bin/bash

mongosh <<EOF
var config = {
    "_id": "mongoSet",
    "version": 1,
    "members": [
        {_id: 0, host: "mongodb1:27017", priority: 1},
        {_id: 1, host: "mongodb2:27017", priority: 0.5}
    ]
};
rs.initiate(config, { force: true });
EOF
echo "****** Waiting for 10 seconds for replicaset configuration to be applied ******"
sleep 10
mongosh <<EOF
    rs.status();
EOF
echo "****** Replicaset configuration applied successfully ******"
sleep 10
echo "Creating users..."
mongosh <<EOF
    use admin;
    admin = db.getSiblingDB('admin');
    admin.createUser({user: '${MONGO_INITDB_ROOT_USERNAME}', pwd: '${MONGO_INITDB_ROOT_PASSWORD}', roles: [{role: 'root', db: 'admin'}]});
EOF
echo "Root user created successfully"
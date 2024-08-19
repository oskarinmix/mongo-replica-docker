###

To generate the key use the command

```
openssl rand -base64 756 > mongo.key
chmod 400 mongo.key
```

### 

Edit the docker-compose file and change the user and password 
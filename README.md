phpredis sample
---

# 1. make compose

it will run `docker-compose build & up`

# 2. make run

run php code and write to redis

main.php

```php
<?php

function connect($server, $port = 6379, $db = 0): \Redis {
    $redis = new \Redis();
    $success = $redis->connect($server, $port);
    if ($success !== true) {
        throw new \Exception(spritnf('failed to connect to %s. port: %s', $server, $port));
    }
    $success = $redis->select($db);
    if ($success !== true) {
        throw new \Exception(spritnf('failed to select database %s. server: %s. port: %s', $db, $server, $port));
    }

    return $redis;
}


function main() {
    $redis = connect('redis');
    $redis->set('xxx', 'aaa');
    $redis->set('yyy', 'bbb');
    $saved = $redis->get('yyy');
    var_dump($saved);
}

main();
```

run make run  

```zsh
$make run
.../make compose/exec service=web command=php args=/opt/app/main.php
docker-compose exec web php /opt/app/main.php
string(3) "bbb"
```

# 3. make redis

confirm if write to redis or not by redis-cli  
run make redis  

```zsh
$make redis
.../make compose/exec service=redis command=redis-cli args="get xxx"
docker-compose exec redis redis-cli get xxx
"aaa"
```

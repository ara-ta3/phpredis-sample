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

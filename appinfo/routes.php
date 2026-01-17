<?php
return [
    'routes' => [
        [
            'name' => 'forum#index',
            'url' => '/stats',
            'verb' => 'GET',
            'controller' => 'ForumController',
            'action' => 'index'
        ]
    ]
];

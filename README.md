# Install

This is designed to be used with eightshift.

To your composer.json add:
```
"repositories": [
    {
        "type": "vcs",
        "url": "https://github.com/Oosik/wp-phpcs-all"
    }
]
```

Run `composer update`

Run `composer require Oosik/wp-phpcs-all --dev`

Then add your scripts
```
"scripts": {
    "standards:fixall": "bash ./vendor/oosik/wp-phpcs-all/run.sh fix",
    "standards:checkall": "bash ./vendor/oosik/wp-phpcs-all/run.sh check"
},
```

You should now be able to run `composer run standards:checkall` and `composer run standards:fixall`

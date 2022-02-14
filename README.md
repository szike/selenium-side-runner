# Selenium Side Runner for firefox and chromium

The image containes the following packages:
* firefox-esr
* geckodriver-v0.30.0
* chromium
* chromium-chromedriver
* jq
* curl
* nodejs
* npm
* selenium-side-runner


## Wrapper Scripts

/usr/local/bin/firefox-runner

    #!/usr/bin/env sh
    set -e
    
    selenium-side-runner \
    -c "browserName=firefox moz:firefoxOptions.args=[-headless]" \
    "$@" 

/usr/local/bin/chromium-runner

    #!/usr/bin/env sh
    set -e
    
    selenium-side-runner \
    -c "browserName=chrome goog:chromeOptions.args=[disable-infobars, headless, no-sandbox, disable-dev-shm-usage]" \
    "$@" 

## Usage
```shell
$ firefox-runner seleniu/test.side
```
```shell
$ chromium-runner seleniu/test.side
```

#!/bin/sh

set -e

SEL_STATUS_URL="${SELENIUM_HUB_PROTO:-http}://${SELENIUM_HUB_HOST:-localhost}:${SELENIUM_HUB_PORT:-4444}/wd/hub/status"

# echo ${SEL_STATUS_URL}

echo "Waiting for Selenium Hub to be ready..."

SEL_STATUS=`docker-compose exec -T selenium bash -c "curl -s ${SEL_STATUS_URL} | jq '.status'"`
# echo "SEL_STATUS: ${SEL_STATUS}"

SEL_STATUS_CMD="docker-compose exec -T selenium bash -c \"curl -s ${SEL_STATUS_URL} | jq '.status'\""


while ! sh -c "${SEL_STATUS_CMD}" -eq "1"; do
  echo -n '.'
  sleep 1
done
echo "Done wait-selenium-hub.sh"

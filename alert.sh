#!/bin/bash
# This script is used to send dummy warning alert to alert manager, and later resolving that alert as well.
# maintainer = ishcse@yahoo.com
#
###########################################################################################################

name=23071984

url='http://http://127.0.0.1:9093/api/v1/alerts'

echo "Firing up alert 23071984” 

# change url o
curl -XPOST $url -d "[{ 
	\"status\": \"firing\",
	\"labels\": {
		\"alertname\": \"$name\",
		\"service\": \"dummy-service\",
		\"severity\":\"warning\",
		\"instance\": \"$name.example.net\"
	},
	\"annotations\": {
		\"summary\": \"This is a Dummy Alert . Please Ignore!\"
	},
	\"generatorURL\": \"http://prometheus.int.example.net/<generating_expression>\"
}]"

echo ""

sleep 5

echo "Sending Resolved for the alert now .."

echo "sending resolve"
curl -XPOST $url -d "[{ 
	\"status\": \"resolved\",
	\"labels\": {
		\"alertname\": \"$name\",
		\"service\": \"dummy-service\",
		\"severity\":\"warning\",
		\"instance\": \"$name.example.net\"
	},
	\"annotations\": {
		\"summary\": \"Resolved: This is a Dummy Alert . Please Ignore!\"
	},
	\"generatorURL\": \"http://prometheus.int.example.net/<generating_expression>\"
}]"
echo ""

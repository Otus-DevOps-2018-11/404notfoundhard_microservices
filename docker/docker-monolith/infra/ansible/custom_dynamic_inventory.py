#!/usr/bin/env python

import json
import commands

hardcoded_file_struct = '{"app":{"children":["docker01","docker02"]},\
                          "docker01":{\
                              "hosts":["127.0.0.1"],\
                              "vars":{"db_host": "127.0.0.1"}},\
                          "docker02":{\
                              "hosts":["127.0.0.1"],\
                              "vars":{"db_host": "127.0.0.1"}}}'

cmd = 'gcloud compute instances list --format="json(name,EXTERNAL_IP,INTERNAL_IP)"'
gcloud_json_raw_output = commands.getstatusoutput(cmd)[1]
gcloud_json_output = json.loads(gcloud_json_raw_output)

for i in gcloud_json_output:
    if 'docker-reddit01' in i['name']:
        docker01_ip = i['networkInterfaces'][0]['accessConfigs'][0]['natIP']
    if 'docker-reddit02' in i['name']:
        docker02_ip = i['networkInterfaces'][0]['accessConfigs'][0]['natIP']

data = json.loads(hardcoded_file_struct)

#set parsed variables
data['docker01']['hosts'][0] = docker01_ip
data['docker02']['hosts'][0] = docker02_ip

print json.dumps(data)

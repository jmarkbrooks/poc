# README

## Setup

1. Install Docker.
2. Install docker-compose.
3. In the root directory, type 'docker-compose build' and press enter, wait until it completes.
4. In the root directory, type 'docker-compose up' and press enter.
5. go to localhost:3001 in a browser, confirm you see a page.
6. In the root directory (separate terminal window) type 'docker-compose run app rails db:create' and press enter.
7. In the root directory (separate terminal window) type 'docker-compose run app rails db:migrate' and press enter.

## API documentation/testing with cURL

1. Device self-registration: curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "device": { "serial_number": "12123344", "registration_date": "2019-03-06T09:00:00.000Z", "firmware_version": "1.00"} }' http://localhost:3001/devices
RESULT: {"message":"Success"}
2. Send a temperature reading (Celsius): curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "temperature": { "serial_number": "12123344", "value": 32.7, "time": "2019-01-03T10:00:00.123Z" } }' http://localhost:3001/temperatures
RESULT: {"message":"Success"}
3. Send a humidity reading: curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "humidity": { "serial_number": "12123344", "value": 55.0, "time": "2019-01-01T20:00:00.123Z" } }' http://localhost:3001/humidities
RESULT: {"message":"Success"}
4. Send a CO reading (PPM): curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "monoxide": { "serial_number": "12123344", "value": 5, "time": "2019-01-01T20:00:00.123Z" } }' http://localhost:3001/monoxides
RESULT: {"message":"Success"}
5. Send a status: curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "status": { "serial_number": "12123344", "value": "ok", "time": "2019-01-01T20:00:00.123Z" } }' http://localhost:3001/statuses
RESULT: {"message":"Success"}

What if you omit the api key?:
curl -H "Content-Type: application/json" -X POST -d '{ "device": { "serial_number": "12123344", "registration_date": "2019-03-06T09:00:00.000Z", "firmware_version": "1.00"} }' http://localhost:3001/devices
RESULT: {"message":"Unauthorized"}

What if the same device tries to register twice?:
curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "device": { "serial_number": "12123344", "registration_date": "2019-03-06T09:00:00.000Z", "firmware_version": "1.00"} }' http://localhost:3001/devices
RESULT: {"serial_number":["device is already registered"]}

## Things remaining to do

1. Implement user authentication (using Devise).
2. Implement an administrative interface (using ActiveAdmin).
3. Implement bulk sends on the API.
4. Implement admin notifications.

##

Public URL: http://theorem-poc-stage.ztumpsdgre.us-east-1.elasticbeanstalk.com/devices

If you wanted to use the API with his URL using cURL, you could do something like this:

curl -H "Content-Type: application/json" -H "Authorization: XGHA-1HAB-Y76Z-29VW" -X POST -d '{ "device": { "serial_number": "12123344", "registration_date": "2019-03-06T09:00:00.000Z", "firmware_version": "1.00"} }' http://theorem-poc-stage.ztumpsdgre.us-east-1.elasticbeanstalk.com/devices

## Things I would do differently

1. Schedule this exercise for a time when I wasn't having to do my regular job and 100 other things.
2. Use a template app, like this one maybe? https://github.com/rootstrap/rails_api_base
3. Or maybe just use a purpose-designed template: https://github.com/matteolc/rails-api-template
4. Keep it simple from the start -- I initially tried to do a more complex app and lost a lot of time before restarting.  And did I really need to do all sensors, when I could prove the concept with only one?
5. For a POC, negotiate a true prototype rather than a baseline -- focus on visual delivery, don't worry about authentication or complex elements.
6. Mock mock mock
7. Redefine the problem in terms of Personas, Problems and Stories to make the requirements easier to understand and scope.

## Things I feel I did right
1. Use Docker.  It just makes it easier to build and deploy.
2. Use Elastic Beanstalk.  It was up pretty fast.  The biggest time investment was installing the eb-cli client on my personal laptop.
3. Focus on a pre-built crud library -- ActiveAdmin in this case, but I ran out of time to execute. :(
4. Using cURL for testing -- this way I could verify the API both in local dev AND on the remote, without having to make the time investment for a full CI/CD or Runscope setup.
5. Use Ruby on Rails -- I'm confident I got much farther on this than I would have otherwise, because even with mistakes, I was able to move faster.
6. Negotiate away SOME complexity.  I understood correctly that notification was too big an ask, as was a more robust API authentication solution.

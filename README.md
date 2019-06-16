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

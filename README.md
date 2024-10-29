# README
### ruby version
3.3.5

### rails version
7.2.1.2

### Gems
for gems data and version go to the gemfile

### Setup the database
1. install postgres sql


# API specification

## Create a new User

create a new user to login

**URL**: `/signup`

**Method**: `POST`

**Body**:
```json
{
  "user":{
    "name": "odi",
    "email": "odi@example.com",
    "password": "secret123",
    "password_confirmation": "secret123"
  }
}

```

**name:** string value 

**email:** string value

**password** string value

**password_confirmation** string value, expect to have the same value of the password


### Successful Response

**Code**: `200 OK`

**Payload**:
```json
{
    "status": {
        "code": 200,
        "message": "Signed up successfully."
    },
    "data": {
        "id": 5,
        "email": "odi4@example.com",
        "name": "odi"
    }
}
```

## login user

login the user and return a bearer token for use the others endpoints, be carefuller the token is returned in the header

**URL**: `/login`

**Method**: `POST`

**Body**:
```json
{
  "user":{
    "email": "odi@example.com",
    "password": "secret123"
  }
}
```
**email:** string value

**password** string value

**Code**: `200 OK`

**header**:
```json
authorization: Bearer CI6bnVsbCwiaWF0IjoxNzMwMTk0MDYyLCJleHAiOjE3MzAxOTU4NjJ9.p2i4QCfq4FgAIUs2dSZZB9Goijn3JdccFcB0TS4PSdU
```


## Create a new Gps_device

create a new gps_device, for this endpoints is need to be authenticated 

**URL**: `/gps_devices`

**Method**: `POST`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

**Body**:
```json
{
  "gps_device":{
    "serial_id": "device_b6"
  }
}
```
**serial_id:** string value, a serial number to identify the gps_device

### Successful Response

**Code**: `201 Created`

**Body**:
```json
{
  "id": 11,
  "serial_id": "device_b6",
  "user_id": 4,
  "created_at": "2024-10-29T09:50:14.348Z",
  "updated_at": "2024-10-29T09:50:14.348Z"
}
```

## show all user's Gps_devices

show all gps_devices created by a user

**URL**: `/gps_devices`

**Method**: `GET`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

**serial_id:** string value, a serial number to identify the gps_device

### Successful Response

**Code**: `200 OK`

**Body**:
```json
[
  {
    "id": 7,
    "serial_id": "device_b1",
    "user_id": 4,
    "created_at": "2024-10-28T20:43:18.408Z",
    "updated_at": "2024-10-28T20:43:18.408Z"
  },
  {
    "id": 8,
    "serial_id": "device_b2",
    "user_id": 4,
    "created_at": "2024-10-28T20:43:37.698Z",
    "updated_at": "2024-10-28T20:43:37.698Z"
  }
]
```

## show a user's gps_devices

show a gps_devices created by the user

**URL**: `/gps_devices/:id`

**Method**: `GET`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

### Successful Response

**Code**: `200 OK`

**Body**:
```json

{
"id": 7,
"serial_id": "device_b1",
"user_id": 4,
"created_at": "2024-10-28T20:43:18.408Z",
"updated_at": "2024-10-28T20:43:18.408Z"
}

```

## update a user's gps_devices

update gps_devices created by the user

**URL**: `/gps_devices/:id`

**Method**: `PATCH`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

**Body**:
the body contains the parameters to change
```json

{
"serial_id": "device_b12"
}

```

**serial_id:** string value, a serial number to identify the gps_device

### Successful Response

**Code**: `200 OK`

**Body**:
return the gps_device with the changes
```json

{
"id": 7,
"serial_id": "device_b12",
"user_id": 4,
"created_at": "2024-10-28T20:43:18.408Z",
"updated_at": "2024-10-28T20:43:18.408Z"
}

```

## delete a user's gps_devices

delete a gps_devices created by the user

**URL**: `/gps_devices/:id`

**Method**: `DELETE`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

### Successful Response

**Code**: `200 OK`

## show all geolocation

show all geolocations from a user or a gps_device

**URL**: `/gps_devices/:id_gps_device/geolocations` geolocations from gps_device

`/geolocations` geolocations from user

**Method**: `GET`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

**serial_id:** string value, a serial number to identify the gps_device

### Successful Response

**Code**: `200 OK`

**Body**:
```json
[
  {
    "id": 16,
    "latitude": "32.7831",
    "longitude": "-96.8067",
    "url": null,
    "ip": "127.0.0.1",
    "source_type": "GpsDevice",
    "source_id": 8,
    "created_at": "2024-10-29T02:46:01.588Z",
    "updated_at": "2024-10-29T02:46:01.588Z",
    "address": {
      "hotel": "SpringHill Suites Dallas Downtown/West End",
      "house_number": "1907",
      "road": "North Lamar Street",
      "neighbourhood": "West End Historic District",
      "quarter": "Downtown PID",
      "city": "Dallas",
      "county": "Dallas County",
      "state": "Texas",
      "postcode": "75202",
      "country": "United States of America",
      "country_code": "us"
    }
  },
  {
    "id": 17,
    "latitude": "20.3796",
    "longitude": "-102.9256",
    "url": null,
    "ip": "45.188.165.193",
    "source_type": "GpsDevice",
    "source_id": 8,
    "created_at": "2024-10-29T02:46:19.179Z",
    "updated_at": "2024-10-29T02:46:19.179Z",
    "address": {
      "road": "Mayagoitia",
      "town": "Poncitlán",
      "county": "Poncitlán",
      "state_district": "Región Ciénega",
      "state": "Jalisco",
      "postcode": "45950",
      "country": "Mexico",
      "country_code": "mx"
    }
  }
]
```
## Create a new geolocation

create a new geolocation for user or gps_device

**URL**: `/gps_devices/:id/geolocations` tot implement the geolocation to the device
`/gps_devices` implement the geolocation to the user

**Method**: `POST`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

**Body**:
```json
{
  "url": "google.com"
}
```
**url:** string optional value, if the url value is gived the aplication get the ip from the url and generate locations 
for the diferentes ips, if the url is not give the location ip come from requester

### Successful Response

**Code**: `201 Created`

**Body**:
if the body contains a url parameter, the url could have more of one ip, each ip generate its geolocation 
```json
{
  "id": 17,
  "latitude": "20.3796",
  "longitude": "-102.9256",
  "url": null,
  "ip": "45.188.165.193",
  "source_type": "GpsDevice",
  "source_id": 8,
  "created_at": "2024-10-29T02:46:19.179Z",
  "updated_at": "2024-10-29T02:46:19.179Z",
}
```

## show a geolocation

show a geolocation from a gps_devices or a user

**URL**: `/gps_devices/:id_gps-device/geolocations/:id_geolocation` get a geolocation from a gps device
`/geolocations/:id_geolocation` get a geolocation from a user

**Method**: `GET`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

### Successful Response

**Code**: `200 OK`

**Body**:
```json
{
  "id": 17,
  "latitude": "20.3796",
  "longitude": "-102.9256",
  "url": null,
  "ip": "45.188.165.193",
  "source_type": "GpsDevice",
  "source_id": 8,
  "created_at": "2024-10-29T02:46:19.179Z",
  "updated_at": "2024-10-29T02:46:19.179Z",
  "address": {
    "road": "Mayagoitia",
    "town": "Poncitlán",
    "county": "Poncitlán",
    "state_district": "Región Ciénega",
    "state": "Jalisco",
    "postcode": "45950",
    "country": "Mexico",
    "country_code": "mx"
  }
}
```

## update geolocation 

update new geolocation for user or gps_device

**URL**: `/gps_devices/:id/geolocations/:id_geolocations` update a existing geolocation from a gps_device
`/geolocations/id_` update a existing geolocation from a user

**Method**: `PATCH`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

**Body**:
```json
{
  "latitude": "20.3796",
  "longitude": "-102.9256",
  "url": "github",
  "ip": "45.188.165.193"
}
```

### Successful Response

**Code**: `200 OK`

**Body**:
return the gelocation with the changes
```json
{
  "id": 17,
  "latitude": "20.3796",
  "longitude": "-102.9256",
  "url": "github",
  "ip": "45.188.165.193",
  "source_type": "GpsDevice",
  "source_id": 8,
  "created_at": "2024-10-29T02:46:19.179Z",
  "updated_at": "2024-10-29T02:46:19.179Z",
}
```

## delete a geolocation 

delete a geolocation from a user or gps_device

**URL**: `/gps_devices/:id_gps_device/geolocations/:id_geolocation` delete a geolocation from a device,
 `/geolocations/:id_geolocation` delete a geolocation from a user

**Method**: `DELETE`

**header**:
the header contains the bearer token to authenticate the user

```json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlMjM5ZGU5My1mNzVjLT
```

### Successful Response

**Code**: `200 OK`

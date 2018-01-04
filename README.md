# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Javascript snippet used in Bloccit application:

```
blocmetrics.report = function(eventName) {
   // #1
   var event = {event: { name: eventName }};

   // #2
   var request = new XMLHttpRequest();
   // #3
   request.open("POST", "http://localhost:3000/api/events", true);
   // #4
   request.setRequestHeader('Content-Type', 'application/json');
   // #5
   request.send(JSON.stringify(event));
}
```

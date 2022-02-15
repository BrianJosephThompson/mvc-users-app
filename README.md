# Users App

This project is my first attempt at implementing the Model View Controller architecture.

The tech stack utilized in this project is composed of a combination of frameworks including Ruby, Sinatra, SQLite, and ERB.

This project was completed on January 15, 2022.


## Getting Started

The instructions below will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Have the below installed on your local machine:

* Ruby
* Sinatra
* SQLite

### Installation

`$ Ruby user_app.rb`

## Usage

You can utilize curl commands to test the multiple routes. Example below:

```
curl -X POST localhost:8080/users -d firstname=Bruce -d lastname=Wayne -d age=40 -d email=Batman@wayneenterprises.com -d password=Catwoman
```



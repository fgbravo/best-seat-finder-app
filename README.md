# Best Seat Finder App

This is a spin off a previous challenge that used an API to pick the best seats possible of a given venue for you.

This time I made it as an APP and developed a bit of a front end to it, to make the experience better.

## Requirements

- Ruby v2.7.1
- Rails v6.0.3
- PostreSQL v12.4

## Getting Started

```sh
$ git clone https://github.com/fgbravo/best-seat-finder-app.git
# You might be asked for credentials to continue forward
$ bundle install
$ rails db:create db:migrate
$ rails server
```

That's it! Just visit http://localhost:3000/ and try it out!

## Considerations

I basically just copied everything from the API and implemented ERB views with it, also using a couple of stimulus controllers to make it feel more dynamic.

I did not implement system tests for the views, since I already tested the results in the API.

It was fun coding this challenge and I've learned a lot with it. Thanks for the opportunity and hope to hear from you soon!
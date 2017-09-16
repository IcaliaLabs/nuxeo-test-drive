# Nuxeo Icalia Test Drive

This is a "test drive" of Nuxeo, which I'm interested in as we are looking for solutions (both
in-house and open-source) to host our knowledge base.

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [Da Team](#team)
* [Management resources](#management-resources)
* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Restoring the database](#restoring-the-database)
* [Debugging](#debugging)
* [Running specs](#running-specs)
* [Checking code for potential issues](#checking-code-for-potential-issues)


### Client Details

In this case, we are our own client ;) I'm leaving this space with the template contents for the lulz

| Name  | Email | Role | Slack |
| ------------- | ------------- | ------------- | ------------- |
| Example Martinez | example@martinez.com | CEO | @example |


### Environment URLS

* **Production** - [https://www.not.yet](https://www.not.yet)
* **Staging** - [https://stagingapp.herokuapp.com](https://stagingapp.herokuapp.com)

### Da team

| Name            | Email           | Role            |
| --------------- | --------------- | --------------- |
| Luis Cejudo     | luis@cejudo.com | Development     |
| Carlos García   | dante@ochoa.com | Development/Mkt |
| Paco Martínez   | dante@ochoa.com | Design          |
| Vov Quintanilla | dante@ochoa.com | Development     |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/IcaliaLabs/<PROJECT_NAME>)
* [Pivotal tracker project](https://www.pivotaltracker.com/n/projects/<PROJECT_ID>)
* [Client Slack](https://team.slack.com/)
* [Heroku](https://heroku.com)

## Development

Since we're not really developing this app (just the docker-related files), I'm including the
"how to run" instructions only:

### How to run:

I need to make an override to nuxeo's entrypoint so it waits until the postgres server is ready to
accept connections, so in the meantime RTFM and start the dependency services first.

Plis makes this easier:

```
# Clone the project:
git clone https://github.com/IcaliaLabs/nuxeo-test-drive.git && cd nuxeo-test-drive

# Start the dependency services first:
plis start dependencies

# Once the previous command finishes, wait a few seconds, and then start the nuxeo service:
plis start nuxeo && plis logs -f
```

Go over to [localhost:8080](http://localhost:8080)

By default, nuxeo will not have an UI - I'll later add the UI packages once I figure out how to

## More info - PLEASE READ!

* [Official nuxeo Github repo](https://github.com/nuxeo/nuxeo)
* [Official nuxeo Docker image at the hub](https://hub.docker.com/_/nuxeo/)

## TODO List:

- [ ] Configure nuxeo to include additional packages (including the UI) using `NUXEO_PACKAGES` env var
- [ ] Work out a
- [ ] Configure nuxeo to use the minio service as it's binary store (and maybe it's transient store?)

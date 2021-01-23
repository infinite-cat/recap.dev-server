<p align="center">
  <a href="https://recap.dev" target="_blank" align="center" style="color: var(--color-text-primary)">
    <img src=".github/assets/logo.svg" width="300">
  </a>
  <br />
</p>

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/infinite-cat/recap.dev-server/blob/master/LICENSE) [![recap.dev Docker Hub](https://img.shields.io/badge/Docker%20Hub-recapdev%2Fserver-informational "recap.dev Docker Hub")](https://hub.docker.com/repository/docker/recapdev/server)

[Website](https://recap.dev) | [Documentation](https://recap.dev/docs/) | [Demo](https://demo.recap.dev/) | [Report a Bug](https://github.com/infinite-cat/recap.dev-server/issues/new)


recap.dev is an open-source cloud observability and tracing solution for modern JavaScript backends. Our goal is to make it easier for everyone to find sources of errors, find bottlenecks, and improve overall developer quality of life.

* **Detailed per-endpoint tracing:** recap.dev builds a timeline of what is going on during endpoint handler execution. 
  That includes database and external calls as well as timings of individual functions simplifying debugging and performance optimization. 
  recap.dev also provides an overview of the system and tries to give you as much useful information as possible.
  
* **Easy-to-setup**: recap.dev server is easy to start with a couple of commands. It is shipped as a Docker container, so it can be
started wherever you host your applications. We try to integrate with as many tools as possible to provide an easy way of tracing your application with minimal to no code changes.
  
* **Open-source**: We believe that development tools should be open-source. Especially tools that might gather or contain sensitive data.
Hosting these tools on your servers is important so that the sensitive data never leaves your organization. It is also important to know what precisely these tools do with your data.

[Learn how to start with recap.dev](https://recap.dev/docs/)

## recap.dev-server

**recap.dev-server** repository holds scripts and docker compose templates to build and run the recap.dev server out of [backend](https://github.com/infinite-cat/recap.dev-backend) and [frontend](https://github.com/infinite-cat/recap.dev-ui) projects.

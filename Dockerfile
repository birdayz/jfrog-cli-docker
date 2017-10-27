# build stage
FROM golang:alpine AS build-env
RUN apk update && apk add git
RUN go get github.com/jfrogdev/jfrog-cli-go/jfrog-cli/jfrog

# final stage
FROM alpine
ENV JFROG_CLI_HOME /.jfrog
WORKDIR /app
COPY --from=build-env /go/bin/jfrog /
CMD /jfrog

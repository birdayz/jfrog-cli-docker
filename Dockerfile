# build stage
FROM golang:alpine AS build-env
RUN apk update && apk add git
ADD . /src
RUN cd /src && go get github.com/jfrogdev/jfrog-cli-go/jfrog-cli/jfrog

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /go/bin/jfrog /
ENTRYPOINT /jfrog

FROM golang:1.13 as build-stage
RUN go env -w GOPROXY=https://goproxy.cn,direct
WORKDIR /go/cache

ADD . .
RUN go mod download
RUN GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -installsuffix cgo -o eagle cmd/eagle.go

FROM alpine:3.9
COPY --from=build-stage /go/cache/eagle /
CMD ["/eagle"]

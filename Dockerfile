FROM golang:1.14 as builder
WORKDIR /app
ADD . /app
RUN go mod download && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go test ./... && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o huyamber .

FROM alpine:latest
COPY --from=builder /app/huyamber /bin 
EXPOSE 8080
CMD ["/bin/huyamber"]


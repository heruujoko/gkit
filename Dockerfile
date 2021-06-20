 
FROM golang:alpine as builder

WORKDIR /app
ADD . .
RUN go build -o /usr/local/bin/hello-world

FROM alpine
WORKDIR /root/
COPY --from=builder /usr/local/bin/hello-world .
EXPOSE 8080
CMD ["./hello-world"]
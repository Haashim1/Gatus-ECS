FROM golang:1.27.1-alpine AS builder

WORKDIR /app

COPY app/go.mod app/go.sum ./
RUN go mod download

COPY app/ .
RUN go build -o server .

FROM alpine

COPY --from=builder /app/server /server
COPY app/config/config.yaml /config/config.yaml

EXPOSE 8080
CMD ["/server"]

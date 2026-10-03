FROM golang:1.27.1-alpine AS builder

WORKDIR /app
COPY app/go.mod app/go.sum ./
RUN go mod download
COPY app/ .
RUN CGO_ENABLED=0 go build -o app .

FROM gcr.io/distroless/static-debian13

COPY --from=builder /app/app /server
COPY app/config.yaml /config/config.yaml

EXPOSE 8080
CMD ["/server"]

# Stage 1: Build the executable
FROM golang:1.19 AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Stage 2: Create a minimal runtime image
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8080
CMD ["./main"]

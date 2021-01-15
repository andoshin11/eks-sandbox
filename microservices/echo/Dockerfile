FROM golang:1.15.6 as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download
COPY ./ /app/
RUN make build

FROM alpine
RUN apk add --no-cache ca-certificates
COPY --from=builder /app/main /app/main
CMD [ "/app/main" ]

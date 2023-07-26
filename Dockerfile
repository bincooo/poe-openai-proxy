FROM golang:1.20-alpine as builder
WORKDIR /app
COPY . .
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY="https://goproxy.cn,direct"
RUN go build 


FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/poe-openai-proxy .
EXPOSE 8080
CMD [ "/app/poe-openai-proxy" ]

FROM golang:alpine AS build-env
RUN apk add --no-cache git
RUN go get -u github.com/schachmat/wego
RUN wego; exit 0

FROM golang:alpine

#RUN apk add --no-cache go ca-certificates; mkdir -p /go/bin
RUN apk add --no-cache curl jq
RUN mkdir -p /go/bin
COPY --from=build-env /go/bin/wego /go/bin
COPY --from=build-env /root/.wegorc /root/.wegorc
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/go/bin/wego"]

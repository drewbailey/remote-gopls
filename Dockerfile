FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git wget

WORKDIR $GOPATH
COPY . .

# Install gopls
RUN GOPROXY=https://proxy.golang.org GO111MODULE=on go get golang.org/x/tools/gopls@v0.4.0

# FROM scratch

# COPY --from=builder /go/bin/gopls /go/bin/gopls

# ENTRYPOINT ["/go/bin/gopls"]

CMD /go/bin/gopls -v -listen=":7050" -logfile=auto -debug=:0

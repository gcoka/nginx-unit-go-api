FROM golang:1.10-stretch as gobuilder

FROM node:9.11-stretch

# golangから必要なものを取得
COPY --from=gobuilder /usr/local/go /usr/local/go

# Go用の環境変数のセット
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# nginx/unit をインストール
WORKDIR /unit
RUN git clone https://github.com/nginx/unit /unit
RUN ./configure
RUN ./configure go
RUN make all
RUN make go-install
RUN make install

# Go言語ビルド用ツールインストール
RUN go get -u github.com/golang/dep/cmd/dep &&\
    go get -u github.com/golang/lint/golint

# yarn global binのPATHを通す
ENV TZ=Asia/Tokyo HOME=/go PATH=$PATH:/home/node/.yarn/bin

# nodemonインストール
RUN yarn global add nodemon

WORKDIR /go/src/github.com/gcoka/nginx-unit-go-api

CMD ["/bin/bash"]

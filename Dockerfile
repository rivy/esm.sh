FROM golang:1.16

EXPOSE 80 

WORKDIR /

RUN apt-get update -y && apt-get install -y xz-utils

RUN git clone https://github.com/postui/esm.sh

WORKDIR /esm.sh

RUN go build -o esmd main.go

CMD ["esmd", "--etc-dir", "/esm.sh", "--db", $DB, "--fs", $FS "--cdn-domain", $CDN_DOMAIN, "--cdn-domain-china", $CDN_DOMAIN_CHINA]

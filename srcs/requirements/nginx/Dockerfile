FROM   debian:bullseye

RUN    apt-get update && apt-get upgrade -y  && apt-get install -y nginx  openssl
RUN    mkdir -p key
COPY   conf/.conf /etc/nginx/nginx.conf
RUN    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /key/privatekey.key -out  /key/ssl.txt -subj "/C=MA/ST=khouribga/L=khouribga/O=Organization/OU=Department/CN=example.com"
EXPOSE 443
CMD    ["nginx", "-g", "daemon off;"]

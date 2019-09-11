FROM alpine
RUN apk add -U tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
WORKDIR /
COPY simpleapp /simpleapp
EXPOSE 8080
CMD [ "./simpleapp" ]

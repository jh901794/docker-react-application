#################################################### 운영용 DockerFile ####################################################
#Builder stage
From node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build 

#Run stage

#/usr/src/app/build
#builder stage에서 build한 결과물들이 저장되는 폴더.

#/usr/share/nginx/html
#nginx가 가동후에 참조하게 되는 파일이 저장되는 폴더.

#nginx 는 클라이언트 브라우저의 request를 받아서,
# /usr/share/nginx 폴더에 있는 파일을 참조하여
# response를 보내는 역할을 한다.


FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx
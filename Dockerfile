#Dockerfile
# docker build -t aimerisson/ndl2023:latest . --platform linux/amd64
# docker push aimerisson/ndl2023:latest    
FROM node:20-alpine AS external-website

WORKDIR /app
COPY . .
RUN npm ci

RUN npm run build

RUN rm -rf src/ static/ k8s/ Dockerfile 

USER node:node

CMD ["node","build/index.js"]

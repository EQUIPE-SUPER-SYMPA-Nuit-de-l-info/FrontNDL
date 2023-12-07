#Dockerfile
# docker build -t aimerisson/ndl2023:latest . --platform linux/amd64
# docker push aimerisson/ndl2023:latest    
FROM node:18-alpine AS external-website

WORKDIR /app
COPY . .
RUN npm ci

RUN npm run build

RUN rm -rf src/ static/ k8s/ Dockerfile

# The USER instruction sets the user name to use as the default user for the remainder of the current stage
USER node:node

# This is the command that will be run inside the image when you tell Docker to start the container
CMD ["node","build/index.js"]

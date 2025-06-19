# For local test 
## Run with npm 
```sh
npm i && npm start
```

## run with docker
- Build docker image: make sure you are in the `website/` 
```sh
docker build -t <image-name> . 
```

- Run the container with environment and the port binding
```sh
docker run -dit -p 8000:8000 -e NODE_ENV=development -e PORT=8000 --name=<container-name> <image-name>
```

- Access the web via `http://localhost:8000` 

# AI Docker Project

This project runs AI models like GPT4All or DeepSeek in a Docker environment.

## Requirements

- Docker
- Docker Compose

## Setup

1. Clone the repository:
```bash
git clone https://github.com/Victor-Zarzar/ai-docker.git
cd ai-docker
```

2. Create a `.env` file at the root of the project with the following variables:
```
MODEL_NAME=gpt4all
MODEL_VERSION=7B
```

You can adjust these variables to use different supported models (gpt4all or deepseek) and their respective versions.

## Running the Project

1. Start the container:
```bash
make up
```
or
```bash
docker-compose up -d
```

2. Check the logs to monitor the model download and initialization:
```bash
make logs
```
or
```bash
docker logs -f ai-container
```

3. To stop the container:
```bash
make down
```
or
```bash
docker-compose down
```

## Interacting with the AI

Once the container is running and the model is loaded, you can interact with the AI in two ways:

### 1. Via REST API (port 5000)

The model exposes a REST API on port 5000. You can send requests to it:

```bash
curl -X POST http://localhost:5000/generate -H "Content-Type: application/json" -d '{"prompt": "Hello, how are you?"}'
```

### 2. Via Command Line Interface

You can access the model's interactive command line by entering the container:

```bash
docker exec -it ai-container bash
cd /models
./gpt4all --model gpt4all-7B.bin --interactive
```

Once in interactive mode, you can type prompts directly, and the AI will respond.

## Project Structure

- `Dockerfile`: Configuration to build the Docker image
- `docker-compose.yml`: Docker service configuration
- `scripts/`: Contains scripts for downloading and running models
  - `download_models.sh`: Script to download models
  - `run_model.sh`: Script to run models
- `models/`: Directory where models are stored (created automatically)
- `config.json`: Application configuration

## Supported Models

- **GPT4All**: A lightweight language model that can run locally
- **DeepSeek**: Another language model supported by the project

## Troubleshooting

- **Permission error**: If you encounter permission errors, make sure the scripts have execution permissions:
  ```bash
  chmod +x scripts/*.sh
  ```

- **Model not found**: Check if the URL in the `download_models.sh` script is correct for the model version you want to use.

- **Port conflicts**: If port 5000 is already in use, change the port configuration in the `docker-compose.yml` file.

- **Model startup error**: Check the logs for error details. You may need to adjust parameters in the `run_model.sh` script.


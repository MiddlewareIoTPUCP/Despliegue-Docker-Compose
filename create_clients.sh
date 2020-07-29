#!/bin/bash

# Script to register applications in Hydra for OAuth2 flows

# Register device service
docker run --rm -it --network middlewareiot -e HYDRA_URL=http://hydra:4445 oryd/hydra:v1.6 \
        clients create --id register_device --secret some_secret --grant-types authorization_code \
        --response-types code --scope all --callbacks http://localhost:8000/docs/oauth2-redirect \
        --token-endpoint-auth-method client_secret_post

# Register data service
docker run --rm -it --network middlewareiot -e HYDRA_URL=http://hydra:4445 oryd/hydra:v1.6 \
        clients create --id register_data --secret some_secret --grant-types authorization_code \
        --response-types code --scope all --callbacks http://localhost:8001/docs/oauth2-redirect \
        --token-endpoint-auth-method client_secret_post

# Postman
docker run --rm -it --network middlewareiot -e HYDRA_URL=http://hydra:4445 oryd/hydra:v1.6 \
        clients create --id postman --secret some_secret --grant-types authorization_code \
        --response-types code --scope all --callbacks https://oauth.pstmn.io/v1/callback

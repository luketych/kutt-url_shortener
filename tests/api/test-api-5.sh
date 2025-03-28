#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
API_KEY="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"
LINK_ID="1903e74e-a4b2-4c48-9d26-779d194e2f68"  # New link ID from successful creation
SHORT_URL="ccam3p"  # New short URL code

echo -e "${GREEN}1. Testing GET /links (list all links)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links"
echo -e "\n"

echo -e "${GREEN}2. Testing GET specific link${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links/$SHORT_URL"
echo -e "\n"

echo -e "${GREEN}3. Testing GET link stats${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links/$SHORT_URL/stats"
echo -e "\n"

echo -e "${GREEN}4. Testing visit shortened URL${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Accept: application/json" \
  -L \
  "http://localhost:3001/$SHORT_URL"

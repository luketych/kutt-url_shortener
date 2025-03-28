#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
API_KEY="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"

echo -e "${GREEN}1. Testing GET /links with X-API-Key header${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links"
echo -e "\n"

echo -e "${GREEN}2. Testing POST /links with X-API-Key header${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -X POST \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "target": "https://www.example.com",
    "description": "Test with X-API-Key",
    "expire_in": "24h"
  }' \
  "$BASE_URL/links"
echo -e "\n"

echo -e "${GREEN}3. Testing GET specific link with X-API-Key header${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links/6cf521c8-984a-4383-87a6-5e6799f1de64"
echo -e "\n"

#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
API_KEY="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"

echo -e "${GREEN}1. Testing GET /links with API key as query param${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Accept: application/json" \
  "$BASE_URL/links?key=$API_KEY"
echo -e "\n"

echo -e "${GREEN}2. Testing POST /links with API key as query param${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "target": "https://www.example.com",
    "description": "Test with API key",
    "expire_in": "24h"
  }' \
  "$BASE_URL/links?key=$API_KEY"
echo -e "\n"

# Test getting stats with API key
echo -e "${GREEN}3. Testing GET /links/stats with API key${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Accept: application/json" \
  "$BASE_URL/links?key=$API_KEY&action=stats"
echo -e "\n"

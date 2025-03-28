#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
TOKEN="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"

echo -e "${GREEN}1. Testing GET /links (should list all links)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json" \
  $BASE_URL/links
echo -e "\n"

echo -e "${GREEN}2. Testing POST /links (creating a new short URL)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -X POST \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "target": "https://www.google.com",
    "description": "Test shortened link",
    "expire_in": "24h"
  }' \
  $BASE_URL/links
echo -e "\n"

# Try without token to test error handling
echo -e "${GREEN}3. Testing GET /links without token (should fail)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Accept: application/json" \
  $BASE_URL/links
echo -e "\n"

# Invalid token test
echo -e "${GREEN}4. Testing GET /links with invalid token (should fail)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Authorization: Bearer invalid_token" \
  -H "Accept: application/json" \
  $BASE_URL/links
echo -e "\n"

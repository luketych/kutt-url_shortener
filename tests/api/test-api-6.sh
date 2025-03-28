#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
API_KEY="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"
LINK_ID="1903e74e-a4b2-4c48-9d26-779d194e2f68"  # Using the full UUID

echo -e "${GREEN}1. Testing GET /links (list all links)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links"
echo -e "\n"

echo -e "${GREEN}2. Testing GET specific link by ID${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links/$LINK_ID"
echo -e "\n"

echo -e "${GREEN}3. Testing GET link stats by ID${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "X-API-Key: $API_KEY" \
  -H "Accept: application/json" \
  "$BASE_URL/links/$LINK_ID/stats"
echo -e "\n"

# Test editing a link
echo -e "${GREEN}4. Testing PATCH link to update description${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -X PATCH \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "description": "Updated test link"
  }' \
  "$BASE_URL/links/$LINK_ID"
echo -e "\n"

# Try visiting the shortened URL
echo -e "${GREEN}5. Testing visit shortened URL${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Accept: application/json" \
  -L \
  "http://localhost:3001/ccam3p"

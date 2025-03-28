#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
TOKEN="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"

echo -e "${GREEN}1. Testing with Bearer token (not working)${NC}"
echo "curl -H 'Authorization: Bearer $TOKEN' $BASE_URL/links"
curl -v -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json" \
  "$BASE_URL/links"
echo -e "\n"

echo -e "${GREEN}2. Testing with X-API-Key header (working)${NC}"
echo "curl -H 'X-API-Key: $TOKEN' $BASE_URL/links"
curl -v -H "X-API-Key: $TOKEN" \
  -H "Accept: application/json" \
  "$BASE_URL/links"
echo -e "\n"

# To explain why: Let's check the auth handler code to see how it's implemented
echo -e "${GREEN}Auth Handler Implementation:${NC}"
echo "In server/handlers/auth.handler.js:"
echo "const apikey = authenticate('localapikey', 'API key is not correct.', false, null);"
echo ""
echo "This shows the API is configured to use 'localapikey' strategy,"
echo "which expects an X-API-Key header, not a Bearer token."

#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

BASE_URL="http://localhost:3001/api"
TOKEN="Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd"
LINK_ID="6cf521c8-984a-4383-87a6-5e6799f1de64"  # ID from our previous successful creation

echo -e "${GREEN}1. Testing GET /links/{id} (should get specific link)${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json" \
  $BASE_URL/links/$LINK_ID

echo -e "\n"

echo -e "${GREEN}2. Testing visiting shortened URL${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Accept: application/json" \
  "http://localhost:3001/6ZsEpb"

echo -e "\n"

echo -e "${GREEN}3. Testing GET /links with stats${NC}"
curl -s -w "\nStatus code: %{http_code}\n" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/json" \
  "$BASE_URL/links/$LINK_ID/stats"

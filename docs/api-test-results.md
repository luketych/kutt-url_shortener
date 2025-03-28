# Kutt API Test Results

## Authentication

### Important: Use X-API-Key, NOT Bearer Token

The API uses a 'localapikey' strategy that specifically expects the token in an `X-API-Key` header:

```bash
# ❌ This will NOT work (401 Unauthorized):
curl -H "Authorization: Bearer Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd" http://localhost:3001/api/links

# ✅ This WILL work (200 OK):
curl -H "X-API-Key: Ow7goeYFA5SAu_P4f5RoKar3fGkcmnpzOwETMsSd" http://localhost:3001/api/links
```

This is due to the server's authentication configuration in `auth.handler.js`:
```javascript
const apikey = authenticate('localapikey', 'API key is not correct.', false, null);
```

## Working Endpoints

### 1. GET /api/links (✅ SUCCESS)
- Status: 200 OK
- Lists all shortened URLs
- Requires X-API-Key header
- Returns paginated list of links

### 2. POST /api/links (✅ SUCCESS)
- Status: 201 Created
- Creates new shortened URLs
- Requires X-API-Key header
- Sample request:
```json
{
  "target": "https://www.example.com",
  "description": "Test link",
  "expire_in": "24h"
}
```

### 3. GET /api/links/{id}/stats (✅ SUCCESS)
- Status: 200 OK
- Shows detailed statistics for a link
- Requires X-API-Key header
- Returns visit counts, browser stats, OS stats, etc.

### 4. PATCH /api/links/{id} (✅ SUCCESS)
- Status: 200 OK
- Updates link details
- Requires X-API-Key header
- Sample request:
```json
{
  "description": "Updated test link"
}
```

### 5. URL Redirection (✅ SUCCESS)
- Status: 200 OK (after redirect)
- /{short_url} redirects to target URL
- No authentication required for redirection

## Known Issues

### 1. GET /api/links/{id} (❌ NOT WORKING)
- Returns 404 HTML page instead of JSON
- May need different route structure for retrieving specific links

## Test Scripts
1. `test-api.sh` - Basic CRUD operations
2. `test-api-2.sh` - URL redirection tests
3. `test-api-3.sh` - Query parameter tests
4. `test-api-4.sh` - X-API-Key header tests
5. `test-api-5.sh` - Short URL tests
6. `test-api-6.sh` - Comprehensive endpoint tests
7. `test-auth-comparison.sh` - Authentication method comparison

## Usage
```bash
# Run comprehensive tests
./test-api-6.sh

# Test authentication methods
./test-auth-comparison.sh

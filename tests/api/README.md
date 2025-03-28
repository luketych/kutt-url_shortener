# Kutt API Tests

This directory contains API test scripts for the Kutt URL shortening service.

## Test Files

1. `test-api.sh` - Basic CRUD operations
2. `test-api-2.sh` - URL redirection tests
3. `test-api-3.sh` - Query parameter tests
4. `test-api-4.sh` - X-API-Key header tests
5. `test-api-5.sh` - Short URL tests
6. `test-api-6.sh` - Comprehensive endpoint tests
7. `test-auth-comparison.sh` - Authentication method comparison

## Running Tests

Make sure the Kutt server is running on port 3001 before running tests.

### Run All Tests
```bash
# Run the comprehensive test suite
./test-api-6.sh
```

### Test Authentication
```bash
# Compare different authentication methods
./test-auth-comparison.sh
```

## Authentication

The API uses X-API-Key header authentication:

```bash
# ✅ Correct way:
curl -H "X-API-Key: YOUR_API_KEY" http://localhost:3001/api/links

# ❌ Wrong way (will fail):
curl -H "Authorization: Bearer YOUR_API_KEY" http://localhost:3001/api/links
```

## Documentation

Full API documentation and test results can be found in `docs/api-test-results.md`.

#!/bin/bash

APP_URL=$(grep '^APP_URL=' .env | cut -d '=' -f2)
BASE_URL="${APP_URL%\"}"
EMAIL="test@example.com"
PASSWORD="password"

echo "🔐 Logging in..."
TOKEN=$(curl -sk -X POST "$BASE_URL/api/login" \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"$EMAIL\", \"password\":\"$PASSWORD\"}" | jq -r .token)

if [[ -z "$TOKEN" || "$TOKEN" == "null" ]]; then
  echo "❌ Failed to get token."
  exit 1
fi

echo "✅ Got token: $TOKEN"

echo "📚 Creating a book..."
BOOK_RESPONSE=$(curl -sk -X POST "$BASE_URL/api/books" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/ld+json" \
  -d '{
    "isbn": "9798769565076",
    "title": "QA Test",
    "description": "Test blah blah",
    "author": "Stef",
    "publicationDate": "2025-04-07"
  }')

BOOK_ID=$(echo "$BOOK_RESPONSE" | jq -r '.id')

if [[ -z "$BOOK_ID" || "$BOOK_ID" == "null" ]]; then
  echo "❌ Failed to create book."
  echo "$BOOK_RESPONSE"
  exit 1
fi

echo "✅ Book created with ID: $BOOK_ID"

echo "📖 Getting all books..."
RESPONSE=$(curl -sk -X GET "$BASE_URL/api/books?page=1" \
  -H "Accept: application/ld+json")
echo "$RESPONSE" | jq '."hydra:member"? // [] | .[] | {id, title}'

echo "📘 Getting book ID $BOOK_ID..."
curl -sk -X GET "$BASE_URL/api/books/$BOOK_ID" \
  -H "Accept: application/ld+json" | jq

echo "✏️ Updating title..."
curl -sk -X PATCH "$BASE_URL/api/books/$BOOK_ID" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/merge-patch+json" \
  -d '{"title": "Updated Title"}'

echo "🗑️ Deleting book ID $BOOK_ID..."
curl -sk -X DELETE "$BASE_URL/api/books/$BOOK_ID" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/ld+json"

echo "✅ Done."

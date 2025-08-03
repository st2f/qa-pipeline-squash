<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BookController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string|min:5',
            'author' => 'required|string|min:3',
            'isbn' => 'required|string|min:5',
            'publication_date' => 'required|date',
        ]);

        $book = Book::create($validated);

        return response()->json($book, 201);
    }

    public function update(Request $request, Book $book)
    {
        $validated = $request->validate([
            'title' => 'sometimes|string|max:255',
            'description' => 'sometimes|string|min:5',
            'author' => 'sometimes|string|min:3',
            'isbn' => 'sometimes|string|min:5',
            'publication_date' => 'sometimes|date',
        ]);

        // enforce that at least 1 field is present
        if (!empty($validated)) {
            $book->update($validated);
        }

        return response()->json($book);
    }

    public function destroy(Book $book)
    {
        $book->delete();

        return response()->json(null, 204);
    }
}

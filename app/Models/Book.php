<?php

namespace App\Models;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Post;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

#[Patch(middleware: 'auth:sanctum')]
#[Post(middleware: 'auth:sanctum')]
#[Delete(middleware: 'auth:sanctum')]
#[ApiResource(
    operations: [
        new GetCollection(),
        new Get(),
//        new Post(),
//        new Patch(),
//        new Delete()
    ],
    paginationItemsPerPage: 10,
)]
class Book extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'author',
        'description',
        'isbn',
        'publication_date',
    ];

}

<?php
namespace App\Models;
use CodeIgniter\Model;


class ExampleModel extends Model
{
    protected $table = 'example';

    protected $primaryKey = 'id';

    protected $allowedFields = ['name', 'code', 'slug'];
}
